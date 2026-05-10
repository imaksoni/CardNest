from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy.orm import Session
from firebase_admin import auth as firebase_auth
from datetime import datetime, timedelta, timezone
import jwt
import logging

from src.db.session import get_db
from src.users.models import User
from src.config import settings
from .dependencies import get_current_user

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/auth", tags=["auth"])

class TokenExchangeRequest(BaseModel):
    firebase_token: str
    role: str # "user" or "business"

class TokenResponse(BaseModel):
    access_token: str
    token_type: str
    user_id: int
    roles: list[str]

class UserProfileResponse(BaseModel):
    id: int
    phone_number: str
    roles: list[str]

def create_access_token(data: dict):
    to_encode = data.copy()
    expire = datetime.now(timezone.utc) + timedelta(minutes=settings.ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, settings.SECRET_KEY, algorithm=settings.ALGORITHM)
    return encoded_jwt

@router.post("/firebase/exchange", response_model=TokenResponse)
def exchange_firebase_token(request: TokenExchangeRequest, db: Session = Depends(get_db)):
    if request.role not in ["user", "business"]:
        raise HTTPException(status_code=400, detail="Invalid role specified")

    try:
        decoded_token = firebase_auth.verify_id_token(request.firebase_token)
    except Exception as e:
        logger.warning(f"Firebase token verification failed: {str(e)}")
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid Firebase token"
        )

    uid = decoded_token.get("uid")
    phone_number = decoded_token.get("phone_number")

    if not phone_number:
        raise HTTPException(status_code=400, detail="No phone number found in Firebase token")

    user = db.query(User).filter(User.firebase_uid == uid).first()

    if not user:
        # Create user
        user = User(
            firebase_uid=uid,
            phone_number=phone_number,
            is_user=(request.role == "user"),
            is_business=(request.role == "business")
        )
        db.add(user)
        db.commit()
        db.refresh(user)
        logger.info(f"Created new user with ID {user.id} and role {request.role}")
    else:
        # Update roles if necessary
        updated = False
        if request.role == "user" and not user.is_user:
            user.is_user = True
            updated = True
        elif request.role == "business" and not user.is_business:
            user.is_business = True
            updated = True

        if updated:
            db.commit()
            db.refresh(user)
            logger.info(f"Updated user {user.id} with new role {request.role}")

    # Generate backend JWT
    access_token = create_access_token(data={"sub": str(user.id)})

    roles = []
    if user.is_user: roles.append("user")
    if user.is_business: roles.append("business")

    return TokenResponse(
        access_token=access_token,
        token_type="bearer",
        user_id=user.id,
        roles=roles
    )

@router.get("/me", response_model=UserProfileResponse)
def get_me(current_user: User = Depends(get_current_user)):
    roles = []
    if current_user.is_user: roles.append("user")
    if current_user.is_business: roles.append("business")

    return UserProfileResponse(
        id=current_user.id,
        phone_number=current_user.phone_number,
        roles=roles
    )
