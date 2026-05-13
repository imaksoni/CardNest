from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy.orm import Session
from src.db.session import get_db
from src.auth.dependencies import get_current_user, require_role
from src.users.models import User, UserProfile
from src.businesses.models import Business
from src.programs.models import Program
from src.cards.models import Card
from src.activities.models import CardActivity
from src.tiers.models import Tier
from typing import List, Optional
from datetime import datetime

router = APIRouter(prefix="/businesses", tags=["businesses"])

class MemberResponse(BaseModel):
    id: int
    firebase_uid: str
    phone_number: str
    display_name: Optional[str] = None

class CardDetailResponse(BaseModel):
    id: int
    program_name: str
    tier_name: Optional[str] = None
    points: int
    created_at: datetime

class ActivityDetailResponse(BaseModel):
    id: int
    points_added: int
    description: Optional[str] = None
    created_at: datetime

class MemberDetailResponse(BaseModel):
    user: MemberResponse
    cards: List[CardDetailResponse]
    activities: List[ActivityDetailResponse]

@router.get("/members", response_model=List[MemberResponse])
def get_business_members(
    db: Session = Depends(get_db),
    current_user: User = Depends(require_role("business"))
):
    business = db.query(Business).filter(Business.owner_id == current_user.id).first()
    if not business:
        return []

    program_ids = [p.id for p in db.query(Program).filter(Program.business_id == business.id).all()]
    if not program_ids:
        return []

    # Get distinct users who have cards for programs of this business
    users = db.query(User).join(Card, Card.user_id == User.id).filter(Card.program_id.in_(program_ids)).distinct().all()

    result = []
    for user in users:
        profile = db.query(UserProfile).filter(UserProfile.user_id == user.id).first()
        result.append(MemberResponse(
            id=user.id,
            firebase_uid=user.firebase_uid,
            phone_number=user.phone_number,
            display_name=profile.display_name if profile else None
        ))

    return result

@router.get("/members/{member_id}", response_model=MemberDetailResponse)
def get_member_detail(
    member_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(require_role("business"))
):
    business = db.query(Business).filter(Business.owner_id == current_user.id).first()
    if not business:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Business not found")

    user = db.query(User).filter(User.id == member_id).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")

    profile = db.query(UserProfile).filter(UserProfile.user_id == user.id).first()
    member = MemberResponse(
        id=user.id,
        firebase_uid=user.firebase_uid,
        phone_number=user.phone_number,
        display_name=profile.display_name if profile else None
    )

    program_ids = [p.id for p in db.query(Program).filter(Program.business_id == business.id).all()]
    cards = db.query(Card).filter(Card.user_id == member_id, Card.program_id.in_(program_ids)).all()

    card_responses = []
    activities_responses = []
    for card in cards:
        program = db.query(Program).filter(Program.id == card.program_id).first()
        tier = db.query(Tier).filter(Tier.id == card.current_tier_id).first() if card.current_tier_id else None

        card_responses.append(CardDetailResponse(
            id=card.id,
            program_name=program.name if program else "Unknown",
            tier_name=tier.name if tier else None,
            points=card.points,
            created_at=card.created_at
        ))

        activities = db.query(CardActivity).filter(CardActivity.card_id == card.id).order_by(CardActivity.created_at.desc()).limit(10).all()
        for activity in activities:
            activities_responses.append(ActivityDetailResponse(
                id=activity.id,
                points_added=activity.points_added,
                description=activity.description,
                created_at=activity.created_at
            ))

    return MemberDetailResponse(
        user=member,
        cards=card_responses,
        activities=activities_responses
    )
