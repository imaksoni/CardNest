import pytest
from fastapi.testclient import TestClient
from src.main import app
from src.users.models import User
from src.businesses.models import Business
from src.programs.models import Program
from src.tiers.models import Tier
from src.cards.models import Card
from src.qr_validation.models import QRValidationEvent
import jwt
from src.config import settings
from unittest.mock import patch
import uuid
from datetime import datetime, timedelta, timezone
from src.qr_validation.router import _get_fernet

# client = TestClient(app)

@pytest.fixture
def test_user(db_session):
    user = User(firebase_uid="test_user_uid", phone_number="+1234567890", is_user=True)
    db_session.add(user)
    db_session.commit()
    return user

@pytest.fixture
def test_business_owner(db_session):
    user = User(firebase_uid="test_biz_uid", phone_number="+1987654321", is_business=True)
    db_session.add(user)
    db_session.commit()
    return user

@pytest.fixture
def test_business(db_session, test_business_owner):
    business = Business(owner_id=test_business_owner.id, name="Test Business")
    db_session.add(business)
    db_session.commit()
    return business

@pytest.fixture
def test_program(db_session, test_business):
    program = Program(business_id=test_business.id, name="Test Program")
    db_session.add(program)
    db_session.commit()
    return program

@pytest.fixture
def test_card(db_session, test_user, test_program):
    card = Card(user_id=test_user.id, program_id=test_program.id, points=100, operation_id="test_op")
    db_session.add(card)
    db_session.commit()
    return card

@pytest.fixture
def user_token(test_user):
    return jwt.encode({"sub": str(test_user.id)}, settings.SECRET_KEY, algorithm=settings.ALGORITHM)

@pytest.fixture
def business_token(test_business_owner):
    return jwt.encode({"sub": str(test_business_owner.id)}, settings.SECRET_KEY, algorithm=settings.ALGORITHM)

def test_generate_qr_token(client, db_session, test_card, user_token):
    response = client.post(
        "/qr_validation/generate",
        headers={"Authorization": f"Bearer {user_token}"},
        json={"card_id": test_card.id}
    )
    assert response.status_code == 200
    data = response.json()
    assert "qr_token" in data
    assert "expires_at" in data

    # Verify the generated token
    encrypted_token = data["qr_token"]
    fernet = _get_fernet()
    jwt_token = fernet.decrypt(encrypted_token.encode()).decode()

    payload = jwt.decode(
        jwt_token,
        settings.SECRET_KEY,
        algorithms=[settings.ALGORITHM],
        audience="cardnest_business",
        issuer="cardnest_app"
    )
    assert payload["sub"] == str(test_card.user_id)
    assert payload["card_id"] == test_card.id
    assert "jti" in payload
    assert "exp" in payload
    assert payload["purpose"] == "qr_validation"

def test_generate_qr_token_invalid_card(client, db_session, user_token):
    response = client.post(
        "/qr_validation/generate",
        headers={"Authorization": f"Bearer {user_token}"},
        json={"card_id": 9999}
    )
    assert response.status_code == 404

def test_validate_qr_token_success(client, db_session, test_card, test_user, test_business, business_token):
    # First generate a token
    expires_at = datetime.now(timezone.utc) + timedelta(minutes=5)
    jti = str(uuid.uuid4())
    payload = {
        "sub": str(test_user.id),
        "card_id": test_card.id,
        "jti": jti,
        "exp": expires_at,
        "purpose": "qr_validation",
        "iss": "cardnest_app",
        "aud": "cardnest_business"
    }
    jwt_token = jwt.encode(payload, settings.SECRET_KEY, algorithm=settings.ALGORITHM)
    fernet = _get_fernet()
    qr_token = fernet.encrypt(jwt_token.encode()).decode()

    # Now validate it as a business
    response = client.post(
        "/qr_validation/validate",
        headers={"Authorization": f"Bearer {business_token}"},
        json={"qr_token": qr_token}
    )
    assert response.status_code == 200
    data = response.json()
    assert data["status"] == "success"
    assert data["business_name"] == test_business.name
    assert data["points"] == 100
    assert "expiry" in data
    assert "validated_at" in data

    # Verify event was recorded
    event = db_session.query(QRValidationEvent).filter(QRValidationEvent.jti == jti).first()
    assert event is not None
    assert event.status == "success"

def test_validate_qr_token_duplicate(client, db_session, test_card, test_user, business_token):
    # First generate a token
    expires_at = datetime.now(timezone.utc) + timedelta(minutes=5)
    jti = str(uuid.uuid4())
    payload = {
        "sub": str(test_user.id),
        "card_id": test_card.id,
        "jti": jti,
        "exp": expires_at,
        "purpose": "qr_validation",
        "iss": "cardnest_app",
        "aud": "cardnest_business"
    }
    jwt_token = jwt.encode(payload, settings.SECRET_KEY, algorithm=settings.ALGORITHM)
    fernet = _get_fernet()
    qr_token = fernet.encrypt(jwt_token.encode()).decode()

    # First validation should succeed
    response = client.post(
        "/qr_validation/validate",
        headers={"Authorization": f"Bearer {business_token}"},
        json={"qr_token": qr_token}
    )
    assert response.status_code == 200
    assert response.json()["status"] == "success"

    # Second validation should fail as duplicate
    response2 = client.post(
        "/qr_validation/validate",
        headers={"Authorization": f"Bearer {business_token}"},
        json={"qr_token": qr_token}
    )
    assert response2.status_code == 200
    assert response2.json()["status"] == "duplicate"
    assert "expiry" in response2.json()

def test_validate_qr_token_expired(client, db_session, test_card, test_user, business_token):
    # Generate an expired token
    expires_at = datetime.now(timezone.utc) - timedelta(minutes=5)
    jti = str(uuid.uuid4())
    payload = {
        "sub": str(test_user.id),
        "card_id": test_card.id,
        "jti": jti,
        "exp": expires_at,
        "purpose": "qr_validation",
        "iss": "cardnest_app",
        "aud": "cardnest_business"
    }
    jwt_token = jwt.encode(payload, settings.SECRET_KEY, algorithm=settings.ALGORITHM)
    fernet = _get_fernet()
    qr_token = fernet.encrypt(jwt_token.encode()).decode()

    response = client.post(
        "/qr_validation/validate",
        headers={"Authorization": f"Bearer {business_token}"},
        json={"qr_token": qr_token}
    )
    assert response.status_code == 200
    assert response.json()["status"] == "expired"
