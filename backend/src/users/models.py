from sqlalchemy import Column, String, Boolean, ForeignKey, Integer
from sqlalchemy.orm import relationship
from src.db.base_class import BaseModel

class User(BaseModel):
    __tablename__ = "users"

    firebase_uid = Column(String, unique=True, index=True, nullable=False)
    phone_number = Column(String, unique=True, index=True, nullable=False)
    is_user = Column(Boolean, default=False)
    is_business = Column(Boolean, default=False)

    profile = relationship("UserProfile", back_populates="user", uselist=False)


class UserProfile(BaseModel):
    __tablename__ = "user_profiles"

    user_id = Column(Integer, ForeignKey("users.id"), unique=True, index=True, nullable=False)
    display_name = Column(String, nullable=True)
    email = Column(String, nullable=True)

    user = relationship("User", back_populates="profile")
