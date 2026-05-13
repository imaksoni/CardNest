from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import relationship
from src.db.base_class import BaseModel

class Business(BaseModel):
    __tablename__ = "businesses"

    name = Column(String, nullable=False)
    owner_id = Column(Integer, ForeignKey("users.id"), index=True, nullable=False)
    description = Column(String, nullable=True)
    logo_url = Column(String, nullable=True)

    programs = relationship("Program", back_populates="business")
