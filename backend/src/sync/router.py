from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session
from datetime import datetime
from typing import Optional

from src.db.session import get_db
from src.users.models import User
from src.auth.dependencies import get_current_user
from src.sync.schemas import SyncPushRequest, SyncPushResponse, SyncPullResponse
from src.sync.service import process_push_operations, get_pull_data

router = APIRouter(prefix="/sync", tags=["sync"])

@router.post("/push", response_model=SyncPushResponse)
def push_sync(
    request: SyncPushRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Push local operations to the server.
    """
    return process_push_operations(db, current_user, request)


@router.get("/pull", response_model=SyncPullResponse)
def pull_sync(
    updated_since: datetime = Query(..., description="ISO 8601 timestamp"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Pull updated records from the server since the given timestamp.
    """
    return get_pull_data(db, current_user, updated_since)
