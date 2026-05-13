from fastapi import APIRouter, Depends, HTTPException, status, BackgroundTasks
from sqlalchemy.orm import Session
from src.db.session import get_db
from src.auth.dependencies import get_current_user, require_role
from src.users.models import User
from src.businesses.models import Business
from src.cards.models import Card
from src.activities.models import AuditEvent
from src.qr_validation.models import QRValidationEvent
from src.qr_validation.schemas import QRGenerateRequest, QRGenerateResponse, QRValidateRequest, QRValidateResponse
from src.config import settings
from datetime import datetime, timedelta, timezone
import jwt
import uuid
import base64
from cryptography.fernet import Fernet, InvalidToken

router = APIRouter(prefix="/qr_validation", tags=["qr_validation"])

def _get_fernet() -> Fernet:
    key = settings.SECRET_KEY.encode()
    if len(key) < 32:
        key = key.ljust(32, b'0')
    elif len(key) > 32:
        key = key[:32]
    return Fernet(base64.urlsafe_b64encode(key))

def cleanup_old_validation_events(db: Session):
    # Cleanup events older than 10 minutes (TTL is 2 minutes, so 10 min is plenty of buffer)
    cutoff = datetime.now(timezone.utc) - timedelta(minutes=10)
    db.query(QRValidationEvent).filter(QRValidationEvent.scanned_at < cutoff).delete(synchronize_session=False)
    db.commit()

@router.post("/generate", response_model=QRGenerateResponse)
def generate_qr_token(
    request: QRGenerateRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(require_role("user"))
):
    # Verify card belongs to user and is not deleted
    card = db.query(Card).filter(Card.id == request.card_id, Card.user_id == current_user.id, Card.is_deleted == False).first()
    if not card:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Card not found or inactive")

    # Generate short-lived token (2 minutes TTL)
    expires_at = datetime.now(timezone.utc) + timedelta(minutes=2)
    jti = str(uuid.uuid4())

    payload = {
        "sub": str(current_user.id),
        "card_id": card.id,
        "jti": jti,
        "exp": expires_at,
        "purpose": "qr_validation",
        "iss": "cardnest_app",
        "aud": "cardnest_business"
    }

    # Encode standard JWT
    jwt_token = jwt.encode(payload, settings.SECRET_KEY, algorithm=settings.ALGORITHM)

    # Encrypt the JWT so raw IDs are not visible
    fernet = _get_fernet()
    encrypted_token = fernet.encrypt(jwt_token.encode()).decode()

    # Clean up old events proactively
    cleanup_old_validation_events(db)

    return QRGenerateResponse(qr_token=encrypted_token, expires_at=expires_at)

@router.post("/validate", response_model=QRValidateResponse)
def validate_qr_token(
    request: QRValidateRequest,
    background_tasks: BackgroundTasks,
    db: Session = Depends(get_db),
    current_user: User = Depends(require_role("business"))
):
    now = datetime.now(timezone.utc)
    business = db.query(Business).filter(Business.owner_id == current_user.id).first()
    business_id = business.id if business else None

    # Helper function for recording rejection audit events
    def record_rejection_audit(action_type: str, message: str, exp=None):
        if business_id:
            audit_op_id = f"qr_rej_{uuid.uuid4()}"
            audit_event = AuditEvent(
                actor_id=current_user.id,
                business_id=business_id,
                target_user_id=current_user.id, # Target user might be unknown, fallback to actor
                program_id=1, # Fallback program if unknown
                action_type=action_type,
                operation_id=audit_op_id

            )
            db.add(audit_event)
            db.commit()
        return QRValidateResponse(status=action_type, message=message, validated_at=now, expiry=exp)

    # 1. Decrypt Fernet token
    fernet = _get_fernet()
    try:
        jwt_token = fernet.decrypt(request.qr_token.encode()).decode()
    except Exception:
        return record_rejection_audit("invalid", "Invalid QR token format")

    # 2. Decode and verify JWT
    try:
        payload = jwt.decode(
            jwt_token,
            settings.SECRET_KEY,
            algorithms=[settings.ALGORITHM],
            audience="cardnest_business",
            issuer="cardnest_app"
        )
        jti = payload.get("jti")
        card_id = payload.get("card_id")
        user_id = payload.get("sub")
        purpose = payload.get("purpose")
        exp_timestamp = payload.get("exp")
        exp = datetime.fromtimestamp(exp_timestamp, tz=timezone.utc) if exp_timestamp else None
    except jwt.ExpiredSignatureError:
        return record_rejection_audit("expired", "QR token has expired")
    except jwt.InvalidAudienceError:
        return record_rejection_audit("invalid", "Invalid QR audience")
    except jwt.InvalidIssuerError:
        return record_rejection_audit("invalid", "Invalid QR issuer")
    except jwt.PyJWTError:
        return record_rejection_audit("invalid", "Invalid QR token signature or format")

    if not jti or not card_id or not user_id or purpose != "qr_validation":
        return record_rejection_audit("invalid", "Invalid QR token payload or purpose", exp)

    # 3. Check for duplicate jti (replay prevention)
    existing_event = db.query(QRValidationEvent).filter(QRValidationEvent.jti == jti).first()
    if existing_event:
        return record_rejection_audit("duplicate", "This QR code has already been used", exp)

    # 4. Retrieve business
    if not business:
        return record_rejection_audit("error", "Business profile not found", exp)

    # 5. Retrieve card and verify it belongs to this business's program
    card = db.query(Card).filter(Card.id == card_id, Card.is_deleted == False).first()
    if not card or str(card.user_id) != str(user_id):
         return record_rejection_audit("invalid", "Card not found or invalid", exp)

    if card.program.business_id != business.id:
        return record_rejection_audit("mismatch", "This card belongs to a different business", exp)

    # 6. Record validation event and audit
    validation_event = QRValidationEvent(
        jti=jti,
        card_id=card.id,
        business_id=business.id,
        scanner_id=current_user.id,
        status="success"
    )
    db.add(validation_event)

    # Provide an audit event
    audit_op_id = f"qr_val_{jti}"
    audit_event = AuditEvent(
        actor_id=current_user.id,
        business_id=business.id,
        target_user_id=card.user_id,
        card_id=card.id,
        program_id=card.program_id,
        tier_id=card.current_tier_id,
        action_type="qr_validation_success",
        operation_id=audit_op_id
    )
    db.add(audit_event)
    db.commit()

    # Determine fallback names
    user_name = "User"
    tier_name = card.tier.name if card.tier else "Member"
    # Format card number for display
    card_number = f"**** {str(card.id).zfill(4)}"

    # Run cleanup in background
    background_tasks.add_task(cleanup_old_validation_events, db)

    return QRValidateResponse(
        status="success",
        user_name=user_name,
        business_name=business.name,
        card_number=card_number,
        tier_name=tier_name,
        points=card.points,
        expiry=exp,
        validated_at=now,
        message="Card validated successfully"
    )
