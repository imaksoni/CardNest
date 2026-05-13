from pydantic import BaseModel, ConfigDict
from typing import List, Dict, Any, Optional
from datetime import datetime

class SyncOperationItem(BaseModel):
    operation_id: str
    action: str
    entity_type: str
    payload: Dict[str, Any]
    timestamp: datetime

    model_config = ConfigDict(from_attributes=True)

class SyncPushRequest(BaseModel):
    operations: List[SyncOperationItem]

class SyncPushResponse(BaseModel):
    processed: List[str]
    failed: List[str]

class SyncPullResponse(BaseModel):
    cards: List[Dict[str, Any]]
    profiles: List[Dict[str, Any]]
    activities: List[Dict[str, Any]]
    business_summaries: List[Dict[str, Any]]
    last_synced_at: datetime
