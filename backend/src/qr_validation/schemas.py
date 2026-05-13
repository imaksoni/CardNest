from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class QRGenerateRequest(BaseModel):
    card_id: int

class QRGenerateResponse(BaseModel):
    qr_token: str
    expires_at: datetime

class QRValidateRequest(BaseModel):
    qr_token: str

class QRValidateResponse(BaseModel):
    status: str
    user_name: Optional[str] = None
    business_name: Optional[str] = None
    card_number: Optional[str] = None
    tier_name: Optional[str] = None
    points: Optional[int] = None
    expiry: Optional[datetime] = None
    validated_at: Optional[datetime] = None
    message: Optional[str] = None
