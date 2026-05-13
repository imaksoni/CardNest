from sqlalchemy import Column, String, Integer, ForeignKey, JSON
from sqlalchemy.orm import relationship
from src.db.base_class import BaseModel

class SyncOperation(BaseModel):
    __tablename__ = "sync_operations"

    operation_id = Column(String, unique=True, index=True, nullable=False)
    user_id = Column(Integer, ForeignKey("users.id"), index=True, nullable=False)
    status = Column(String, nullable=False) # e.g. "success", "failed"
    action = Column(String, nullable=False) # e.g. "create", "update"
    entity_type = Column(String, nullable=False) # e.g. "profile", "card"
    entity_id = Column(String, nullable=True) # Optional ID of the affected entity
    error_message = Column(String, nullable=True)
    payload = Column(JSON, nullable=True)

    user = relationship("User")
