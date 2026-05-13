from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy.orm import Session
from src.db.session import get_db
from src.auth.dependencies import get_current_user
from src.users.models import User, UserProfile
from typing import Optional

router = APIRouter(prefix="/users", tags=["users"])

class UserProfileCreateUpdate(BaseModel):
    display_name: Optional[str] = None
    email: Optional[str] = None

class UserProfileResponse(BaseModel):
    id: int
    user_id: int
    display_name: Optional[str] = None
    email: Optional[str] = None

    class Config:
        from_attributes = True

@router.post("/profile", response_model=UserProfileResponse)
def create_or_update_profile(
    profile_data: UserProfileCreateUpdate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    profile = db.query(UserProfile).filter(UserProfile.user_id == current_user.id).first()

    if profile:
        # Update
        if profile_data.display_name is not None:
            profile.display_name = profile_data.display_name
        if profile_data.email is not None:
            profile.email = profile_data.email
    else:
        # Create
        profile = UserProfile(
            user_id=current_user.id,
            display_name=profile_data.display_name,
            email=profile_data.email
        )
        db.add(profile)

    db.commit()
    db.refresh(profile)
    return profile

@router.get("/profile", response_model=UserProfileResponse)
def get_profile(
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    profile = db.query(UserProfile).filter(UserProfile.user_id == current_user.id).first()
    if not profile:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Profile not found")
    return profile

class UserSearchResponse(BaseModel):
    id: int
    firebase_uid: str
    phone_number: str
    display_name: Optional[str] = None
    email: Optional[str] = None

@router.get("/search", response_model=UserSearchResponse)
def search_user(
    phone: str,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    user = db.query(User).filter(User.phone_number == phone).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")

    profile = db.query(UserProfile).filter(UserProfile.user_id == user.id).first()

    return UserSearchResponse(
        id=user.id,
        firebase_uid=user.firebase_uid,
        phone_number=user.phone_number,
        display_name=profile.display_name if profile else None,
        email=profile.email if profile else None
    )
