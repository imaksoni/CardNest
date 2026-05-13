from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy.orm import Session
from src.db.session import get_db
from src.auth.dependencies import get_current_user, require_role
from src.users.models import User
from src.businesses.models import Business
from src.programs.models import Program
from src.cards.models import Card
from src.activities.models import CardActivity, AuditEvent
from src.tiers.models import Tier
from typing import List, Optional
from datetime import datetime, timedelta, timezone
import uuid

router = APIRouter(prefix="/cards", tags=["cards"])

class IssueCardRequest(BaseModel):
    user_id: int
    program_id: int
    tier_id: Optional[int] = None
    operation_id: str

class IssueCardResponse(BaseModel):
    id: int
    user_id: int
    program_id: int
    points: int
    operation_id: str

@router.post("/issue", response_model=IssueCardResponse)
def issue_card(
    request: IssueCardRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(require_role("business"))
):
    business = db.query(Business).filter(Business.owner_id == current_user.id).first()
    if not business:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Business not found")

    program = db.query(Program).filter(Program.id == request.program_id, Program.business_id == business.id).first()
    if not program:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Program not found or does not belong to business")

    if request.tier_id:
        tier = db.query(Tier).filter(Tier.id == request.tier_id, Tier.program_id == program.id).first()
        if not tier:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Tier not found or does not belong to program")

    user = db.query(User).filter(User.id == request.user_id).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")

    # Check for idempotency
    existing_card_by_op = db.query(Card).filter(Card.operation_id == request.operation_id).first()
    if existing_card_by_op:
        return IssueCardResponse(
            id=existing_card_by_op.id,
            user_id=existing_card_by_op.user_id,
            program_id=existing_card_by_op.program_id,
            points=existing_card_by_op.points,
            operation_id=existing_card_by_op.operation_id
        )

    # MVP Duplicate Policy: One active card per user per program
    existing_active_card = db.query(Card).filter(
        Card.user_id == user.id,
        Card.program_id == program.id,
        Card.is_deleted == False
    ).first()

    if existing_active_card:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="User already has an active card for this program")

    # Issue new card
    new_card = Card(
        user_id=user.id,
        program_id=program.id,
        current_tier_id=request.tier_id,
        points=0,
        operation_id=request.operation_id
    )
    db.add(new_card)
    db.flush() # flush to get the id

    # Create audit event
    activity = CardActivity(
        card_id=new_card.id,
        points_added=0,
        description="Card issued",
        operation_id=request.operation_id
    )
    db.add(activity)

    audit_event = AuditEvent(
        actor_id=current_user.id,
        business_id=business.id,
        target_user_id=user.id,
        card_id=new_card.id,
        program_id=program.id,
        tier_id=request.tier_id,
        action_type="card_issued",
        operation_id=request.operation_id
    )
    db.add(audit_event)

    db.commit()
    db.refresh(new_card)

    return IssueCardResponse(
        id=new_card.id,
        user_id=new_card.user_id,
        program_id=new_card.program_id,
        points=new_card.points,
        operation_id=new_card.operation_id
    )

class CardMockResponse(BaseModel):
    id: str
    card_number: str
    user_name: str
    business_name: str
    tier_name: str
    points: int
    expiry: Optional[str]
    cvv: str
    visual_color: str

@router.get("/my-cards", response_model=List[CardMockResponse])
def get_my_cards():
    """Mock API to return a list of cards for the wallet home screen."""
    return [
        CardMockResponse(
            id=str(uuid.uuid4()),
            card_number="1234 5678 9012 3456",
            user_name="John Doe",
            business_name="Coffee Beans",
            tier_name="Gold",
            points=1250,
            expiry=(datetime.now(timezone.utc) + timedelta(days=365)).strftime("%m/%y"),
            cvv="123",
            visual_color="0xFFD4AF37" # Gold
        ),
        CardMockResponse(
            id=str(uuid.uuid4()),
            card_number="9876 5432 1098 7654",
            user_name="John Doe",
            business_name="Burger Joint",
            tier_name="Silver",
            points=450,
            expiry=(datetime.now(timezone.utc) + timedelta(days=180)).strftime("%m/%y"),
            cvv="456",
            visual_color="0xFFC0C0C0" # Silver
        )
    ]
