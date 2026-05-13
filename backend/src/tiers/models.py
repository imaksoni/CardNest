from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import relationship
from src.db.base_class import BaseModel

class Tier(BaseModel):
    __tablename__ = "tiers"

    program_id = Column(Integer, ForeignKey("programs.id"), index=True, nullable=False)
    name = Column(String, nullable=False)
    points_required = Column(Integer, nullable=False, default=0)
    benefits = Column(String, nullable=True)

    program = relationship("Program", back_populates="tiers")
