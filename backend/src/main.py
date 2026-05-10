from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
import firebase_admin
from firebase_admin import credentials
import logging
from contextlib import asynccontextmanager

from .auth.router import router as auth_router
from .config import settings
from .users.router import router as users_router
from .businesses.router import router as businesses_router
from .programs.router import router as programs_router
from .tiers.router import router as tiers_router
from .cards.router import router as cards_router
from .activities.router import router as activities_router
from .qr_validation.router import router as qr_validation_router
from .sync.router import router as sync_router

logger = logging.getLogger(__name__)

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Initialize Firebase Admin SDK
    try:
        if settings.FIREBASE_CREDENTIALS_PATH:
            cred = credentials.Certificate(settings.FIREBASE_CREDENTIALS_PATH)
            firebase_admin.initialize_app(cred)
            logger.info("Firebase Admin SDK initialized successfully")
        else:
            logger.warning("FIREBASE_CREDENTIALS_PATH not set, skipping Firebase initialization")
    except Exception as e:
        logger.warning(f"Could not initialize Firebase Admin SDK: {e}")

    yield

app = FastAPI(title="CardNest API", version="0.1.0", lifespan=lifespan)

# Exception handling
@app.exception_handler(Exception)
async def global_exception_handler(request: Request, exc: Exception):
    return JSONResponse(
        status_code=500,
        content={"message": "Internal server error", "details": str(exc)},
    )

# Include Routers
app.include_router(auth_router)
app.include_router(users_router)
app.include_router(businesses_router)
app.include_router(programs_router)
app.include_router(tiers_router)
app.include_router(cards_router)
app.include_router(activities_router)
app.include_router(qr_validation_router)
app.include_router(sync_router)

@app.get("/health", tags=["Health"])
def health_check():
    return {"status": "ok"}
