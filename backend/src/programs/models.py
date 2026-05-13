from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import relationship
from src.db.base_class import BaseModel

class Program(BaseModel):
    __tablename__ = "programs"

    business_id = Column(Integer, ForeignKey("businesses.id"), index=True, nullable=False)
    name = Column(String, nullable=False)
    description = Column(String, nullable=True)

    business = relationship("Business", back_populates="programs")
    tiers = relationship("Tier", back_populates="program")
    cards = relationship("Card", back_populates="program")
