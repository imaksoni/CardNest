from sqlalchemy import Column, String, Integer, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from src.db.base_class import BaseModel

class Card(BaseModel):
    __tablename__ = "cards"

    user_id = Column(Integer, ForeignKey("users.id"), index=True, nullable=False)
    program_id = Column(Integer, ForeignKey("programs.id"), index=True, nullable=False)
    current_tier_id = Column(Integer, ForeignKey("tiers.id"), nullable=True)
    points = Column(Integer, nullable=False, default=0)
    is_deleted = Column(Boolean, nullable=False, default=False)
    operation_id = Column(String, nullable=True, unique=True, index=True)

    user = relationship("User")
    program = relationship("Program", back_populates="cards")
    tier = relationship("Tier")
    activities = relationship("CardActivity", back_populates="card")
