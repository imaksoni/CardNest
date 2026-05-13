import logging
from sqlalchemy.orm import Session
from datetime import datetime, timezone
from src.users.models import User, UserProfile
from src.cards.models import Card
from src.activities.models import CardActivity, AuditEvent
from src.businesses.models import Business
from src.sync.models import SyncOperation
from src.sync.schemas import SyncPushRequest, SyncPushResponse, SyncPullResponse, SyncOperationItem
from src.redis_client import redis_client
from typing import Dict, Any, List

logger = logging.getLogger(__name__)

def process_push_operations(db: Session, user: User, request: SyncPushRequest) -> SyncPushResponse:
    processed = []
    failed = []

    user_id = user.id

    for op in request.operations:
        lock_key = f"sync:op:{op.operation_id}"
        acquired = redis_client.set(lock_key, "locked", nx=True, ex=60)

        if not acquired:
            logger.warning(f"Operation {op.operation_id} is already being processed.")
            failed.append(op.operation_id)
            continue

        try:
            existing_op = db.query(SyncOperation).filter(SyncOperation.operation_id == op.operation_id).first()
            if existing_op:
                if existing_op.status == "success":
                    logger.info(f"Operation {op.operation_id} already processed successfully. Idempotent skip.")
                    processed.append(op.operation_id)
                else:
                    logger.warning(f"Operation {op.operation_id} already exists with status {existing_op.status}. Failing.")
                    failed.append(op.operation_id)
                continue

            error_message = None

            try:
                # Use a nested transaction inside this block
                db.begin_nested()

                db_op = SyncOperation(
                    operation_id=op.operation_id,
                    user_id=user_id,
                    action=op.action,
                    entity_type=op.entity_type,
                    payload=op.payload,
                    status="processing"
                )
                db.add(db_op)

                # Fetch fresh user object for inner operations
                inner_user = db.query(User).filter(User.id == user_id).first()

                if op.entity_type == "profile":
                    _process_profile_op(db, inner_user, op)
                elif op.entity_type == "card":
                    _process_card_op(db, inner_user, op)
                elif op.entity_type == "activity":
                    _process_activity_op(db, inner_user, op)
                else:
                    error_message = f"Unknown entity_type: {op.entity_type}"

                db_op.status = "success" if not error_message else "failed"
                db_op.error_message = error_message

                db.commit() # Commit nested
            except Exception as e:
                db.rollback() # Rollback nested transaction only
                error_message = str(e)
                logger.error(f"Error processing operation {op.operation_id}: {error_message}")

                try:
                    db.begin_nested()
                    # Now insert the failed record directly in the main transaction
                    db_op = SyncOperation(
                        operation_id=op.operation_id,
                        user_id=user_id, # Using ID directly to avoid detached session issues
                        action=op.action,
                        entity_type=op.entity_type,
                        payload=op.payload,
                        status="failed",
                        error_message=error_message
                    )
                    db.add(db_op)
                    db.commit()
                except Exception as inner_e:
                    db.rollback()
                    logger.error(f"Failed to record failure for operation {op.operation_id}: {inner_e}")

            if error_message:
                failed.append(op.operation_id)
            else:
                processed.append(op.operation_id)

            db.commit() # Commit the main transaction containing the overall result

        except Exception as e:
            logger.error(f"Unexpected error handling operation {op.operation_id}: {e}")
            db.rollback()
            failed.append(op.operation_id)
        finally:
            redis_client.delete(lock_key)

    return SyncPushResponse(processed=processed, failed=failed)

def _process_profile_op(db: Session, user: User, op: SyncOperationItem):
    profile = db.query(UserProfile).filter(UserProfile.user_id == user.id).first()

    op_time = op.timestamp
    if op_time.tzinfo is None:
        op_time = op_time.replace(tzinfo=timezone.utc)

    if profile:
        profile_updated_at = profile.updated_at or profile.created_at
        if profile_updated_at.tzinfo is None:
            profile_updated_at = profile_updated_at.replace(tzinfo=timezone.utc)

        if op.action == "update":
            # Last-write-wins: Only update if the incoming payload is strictly newer
            if op_time > profile_updated_at:
                if "display_name" in op.payload:
                    profile.display_name = op.payload["display_name"]
                if "email" in op.payload:
                    profile.email = op.payload["email"]
            else:
                logger.info(f"Conflict resolution: Ignored stale update for profile {user.id}")
    else:
        if op.action == "create":
            profile = UserProfile(
                user_id=user.id,
                display_name=op.payload.get("display_name"),
                email=op.payload.get("email")
            )
            db.add(profile)

def _process_card_op(db: Session, user: User, op: SyncOperationItem):
    if op.action == "create":
        program_id = op.payload.get("program_id")
        existing_card = db.query(Card).filter(Card.user_id == user.id, Card.program_id == program_id, Card.is_deleted == False).first()
        if existing_card:
            raise ValueError(f"User already has a card for program {program_id}")

        card = Card(
            user_id=user.id,
            program_id=program_id,
            current_tier_id=op.payload.get("current_tier_id"),
            points=op.payload.get("points", 0),
            operation_id=op.operation_id
        )
        db.add(card)

def _process_activity_op(db: Session, user: User, op: SyncOperationItem):
    if op.action == "create":
        card_id = op.payload.get("card_id")

        # Verify card exists and belongs to the user or user is authorized business
        card = db.query(Card).filter(Card.id == card_id).first()
        if not card:
            raise ValueError(f"Card {card_id} not found")

        if card.user_id != user.id:
            # Check if user is a business and owns the program the card belongs to
            if not user.is_business:
                raise ValueError(f"Not authorized to add activity to card {card_id}")

            program = card.program
            if not program or program.business.owner_id != user.id:
                raise ValueError(f"Not authorized to add activity to card {card_id}")

        activity = CardActivity(
            card_id=card_id,
            points_added=op.payload.get("points_added", 0),
            description=op.payload.get("description"),
            operation_id=op.operation_id
        )
        db.add(activity)

def get_pull_data(db: Session, user: User, updated_since: datetime) -> SyncPullResponse:
    if updated_since.tzinfo is None:
        updated_since = updated_since.replace(tzinfo=timezone.utc)

    profiles_data = []
    if user.profile:
        profile_updated = user.profile.updated_at or user.profile.created_at
        if profile_updated and profile_updated.replace(tzinfo=timezone.utc) > updated_since:
            profiles_data.append({
                "id": user.profile.id,
                "user_id": user.profile.user_id,
                "display_name": user.profile.display_name,
                "email": user.profile.email,
                "updated_at": profile_updated.isoformat() if profile_updated else None
            })

    cards_query = db.query(Card).filter(Card.user_id == user.id)
    cards_data = []
    for c in cards_query.all():
        updated = c.updated_at or c.created_at
        if updated and updated.replace(tzinfo=timezone.utc) > updated_since:
            cards_data.append({
                "id": c.id,
                "program_id": c.program_id,
                "current_tier_id": c.current_tier_id,
                "points": c.points,
                "is_deleted": c.is_deleted,
                "updated_at": updated.isoformat() if updated else None
            })

    activities_data = []
    card_ids = [c.id for c in user.cards] if hasattr(user, 'cards') else []
    if not card_ids:
        user_cards = db.query(Card).filter(Card.user_id == user.id).all()
        card_ids = [c.id for c in user_cards]

    if card_ids:
        activities = db.query(CardActivity).filter(CardActivity.card_id.in_(card_ids)).all()
        for a in activities:
            updated = a.updated_at or a.created_at
            if updated and updated.replace(tzinfo=timezone.utc) > updated_since:
                activities_data.append({
                    "id": a.id,
                    "card_id": a.card_id,
                    "points_added": a.points_added,
                    "description": a.description,
                    "is_deleted": a.is_deleted,
                    "updated_at": updated.isoformat() if updated else None
                })

    business_summaries_data = []
    if user.is_business:
        businesses = db.query(Business).filter(Business.owner_id == user.id).all()
        for b in businesses:
            updated = b.updated_at or b.created_at
            if updated and updated.replace(tzinfo=timezone.utc) > updated_since:
                business_summaries_data.append({
                    "id": b.id,
                    "name": b.name,
                    "description": b.description,
                    "logo_url": b.logo_url,
                    "updated_at": updated.isoformat() if updated else None
                })

    return SyncPullResponse(
        cards=cards_data,
        profiles=profiles_data,
        activities=activities_data,
        business_summaries=business_summaries_data,
        last_synced_at=datetime.now(timezone.utc)
    )
