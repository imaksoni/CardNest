from sqlalchemy import Column, String, Integer, ForeignKey, Boolean, DateTime
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship
from src.db.base_class import BaseModel

class QRValidationEvent(BaseModel):
    __tablename__ = "qr_validation_events"

    jti = Column(String, unique=True, index=True, nullable=False)
    card_id = Column(Integer, ForeignKey("cards.id"), index=True, nullable=False)
    business_id = Column(Integer, ForeignKey("businesses.id"), index=True, nullable=False)
    scanner_id = Column(Integer, ForeignKey("users.id"), index=True, nullable=False)
    scanned_at = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)
    status = Column(String, nullable=False) # e.g. "success", "invalid", "expired", "duplicate"

    card = relationship("Card")
    business = relationship("Business")
    scanner = relationship("User")
