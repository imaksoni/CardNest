from sqlalchemy import Column, String, Integer, ForeignKey, Boolean, DateTime
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship
from src.db.base_class import BaseModel

class CardActivity(BaseModel):
    __tablename__ = "card_activities"

    card_id = Column(Integer, ForeignKey("cards.id"), index=True, nullable=False)
    points_added = Column(Integer, nullable=False, default=0)
    description = Column(String, nullable=True)
    is_deleted = Column(Boolean, nullable=False, default=False)
    operation_id = Column(String, nullable=True, unique=True, index=True)

    card = relationship("Card", back_populates="activities")

class AuditEvent(BaseModel):
    __tablename__ = "audit_events"

    actor_id = Column(Integer, ForeignKey("users.id"), index=True, nullable=False)
    business_id = Column(Integer, ForeignKey("businesses.id"), index=True, nullable=False)
    target_user_id = Column(Integer, ForeignKey("users.id"), index=True, nullable=False)
    card_id = Column(Integer, ForeignKey("cards.id"), index=True, nullable=True)
    program_id = Column(Integer, ForeignKey("programs.id"), index=True, nullable=False)
    tier_id = Column(Integer, ForeignKey("tiers.id"), index=True, nullable=True)
    action_type = Column(String, nullable=False) # e.g. "card_issued"
    operation_id = Column(String, nullable=True, unique=True, index=True)
