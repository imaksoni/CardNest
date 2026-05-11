from fastapi import APIRouter, Depends
from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime, timedelta, timezone
import uuid

router = APIRouter(prefix="/cards", tags=["cards"])

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
