from sqlalchemy import Column, String, Boolean
from src.db.base_class import BaseModel

class User(BaseModel):
    __tablename__ = "users"

    firebase_uid = Column(String, unique=True, index=True, nullable=False)
    phone_number = Column(String, unique=True, index=True, nullable=False)
    is_user = Column(Boolean, default=False)
    is_business = Column(Boolean, default=False)
