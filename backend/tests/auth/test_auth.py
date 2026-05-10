import pytest
from unittest.mock import patch
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.pool import StaticPool

# Import DB Base containing all registered models
from src.db.base import Base
from src.db.session import get_db
from src.users.models import User
from src.main import app

# Set up an in-memory database for testing using StaticPool to keep it alive across thread boundaries
SQLALCHEMY_DATABASE_URL = "sqlite:///:memory:"
engine = create_engine(
    SQLALCHEMY_DATABASE_URL,
    connect_args={"check_same_thread": False},
    poolclass=StaticPool,
)
TestingSessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

@pytest.fixture(autouse=True)
def setup_database():
    # Create the tables in the in-memory database
    Base.metadata.create_all(bind=engine)
    yield
    # Drop tables after each test
    Base.metadata.drop_all(bind=engine)

@pytest.fixture
def db_session():
    db = TestingSessionLocal()
    try:
        yield db
    finally:
        db.close()

@pytest.fixture
def override_get_db(db_session):
    def _override_get_db():
        yield db_session
    app.dependency_overrides[get_db] = _override_get_db
    yield
    app.dependency_overrides.pop(get_db, None)

@patch("src.auth.router.firebase_auth.verify_id_token")
def test_exchange_firebase_token_new_user(mock_verify_id_token, client, override_get_db, db_session):
    mock_verify_id_token.return_value = {
        "uid": "firebase_uid_123",
        "phone_number": "+1234567890"
    }

    response = client.post("/auth/firebase/exchange", json={
        "firebase_token": "fake_token",
        "role": "user"
    })

    assert response.status_code == 200
    data = response.json()
    assert "access_token" in data
    assert data["token_type"] == "bearer"
    assert "user" in data["roles"]

    # Verify user was created in DB
    user = db_session.query(User).filter(User.firebase_uid == "firebase_uid_123").first()
    assert user is not None
    assert user.phone_number == "+1234567890"
    assert user.is_user is True
    assert user.is_business is False

@patch("src.auth.router.firebase_auth.verify_id_token")
def test_exchange_firebase_token_existing_user_new_role(mock_verify_id_token, client, override_get_db, db_session):
    # Setup existing user
    user = User(firebase_uid="firebase_uid_456", phone_number="+0987654321", is_user=True, is_business=False)
    db_session.add(user)
    db_session.commit()

    mock_verify_id_token.return_value = {
        "uid": "firebase_uid_456",
        "phone_number": "+0987654321"
    }

    response = client.post("/auth/firebase/exchange", json={
        "firebase_token": "fake_token",
        "role": "business"
    })

    assert response.status_code == 200
    data = response.json()
    assert "business" in data["roles"]
    assert "user" in data["roles"]

    # Verify user was updated in DB
    updated_user = db_session.query(User).filter(User.firebase_uid == "firebase_uid_456").first()
    assert updated_user.is_user is True
    assert updated_user.is_business is True

@patch("src.auth.router.firebase_auth.verify_id_token")
def test_get_me(mock_verify_id_token, client, override_get_db, db_session):
    mock_verify_id_token.return_value = {
        "uid": "firebase_uid_789",
        "phone_number": "+111222333"
    }

    # First, get a token
    response = client.post("/auth/firebase/exchange", json={
        "firebase_token": "fake_token",
        "role": "user"
    })
    access_token = response.json()["access_token"]

    # Now, use the token to get /me
    response = client.get("/auth/me", headers={"Authorization": f"Bearer {access_token}"})

    assert response.status_code == 200
    data = response.json()
    assert data["phone_number"] == "+111222333"
    assert "user" in data["roles"]
