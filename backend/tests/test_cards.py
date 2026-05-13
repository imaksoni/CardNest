import pytest
from src.users.models import User
from src.businesses.models import Business
from src.programs.models import Program
from src.tiers.models import Tier
from src.cards.models import Card
from src.auth.dependencies import get_current_user
import uuid

@pytest.fixture
def mock_business_user(db_session):
    user = User(firebase_uid="biz_uid", phone_number="+1000000001", is_business=True)
    db_session.add(user)
    db_session.commit()
    db_session.refresh(user)
    return user

@pytest.fixture
def mock_business(db_session, mock_business_user):
    business = Business(name="Test Biz", owner_id=mock_business_user.id)
    db_session.add(business)
    db_session.commit()
    db_session.refresh(business)
    return business

@pytest.fixture
def mock_program(db_session, mock_business):
    program = Program(name="Test Program", business_id=mock_business.id)
    db_session.add(program)
    db_session.commit()
    db_session.refresh(program)
    return program

@pytest.fixture
def mock_tier(db_session, mock_program):
    tier = Tier(name="Bronze", program_id=mock_program.id)
    db_session.add(tier)
    db_session.commit()
    db_session.refresh(tier)
    return tier

@pytest.fixture
def mock_target_user(db_session):
    user = User(firebase_uid="target_uid", phone_number="+1000000002", is_user=True)
    db_session.add(user)
    db_session.commit()
    db_session.refresh(user)
    return user

def test_issue_card_success(client, db_session, mock_business_user, mock_business, mock_program, mock_tier, mock_target_user):
    # Override dependency manually if needed, or rely on token. For simplicity, mock the auth.
    from src.main import app
    app.dependency_overrides[get_current_user] = lambda: mock_business_user

    op_id = str(uuid.uuid4())

    response = client.post("/cards/issue", json={
        "user_id": mock_target_user.id,
        "program_id": mock_program.id,
        "tier_id": mock_tier.id,
        "operation_id": op_id
    })

    assert response.status_code == 200
    data = response.json()
    assert data["user_id"] == mock_target_user.id
    assert data["program_id"] == mock_program.id
    assert data["operation_id"] == op_id

    app.dependency_overrides.clear()

def test_issue_card_idempotency(client, db_session, mock_business_user, mock_business, mock_program, mock_target_user):
    from src.main import app
    app.dependency_overrides[get_current_user] = lambda: mock_business_user

    op_id = str(uuid.uuid4())

    # First issue
    res1 = client.post("/cards/issue", json={
        "user_id": mock_target_user.id,
        "program_id": mock_program.id,
        "operation_id": op_id
    })
    assert res1.status_code == 200

    # Second issue with same op_id
    res2 = client.post("/cards/issue", json={
        "user_id": mock_target_user.id,
        "program_id": mock_program.id,
        "operation_id": op_id
    })
    assert res2.status_code == 200
    assert res1.json()["id"] == res2.json()["id"] # Should return exact same card

    # Check duplicate policy with DIFFERENT op_id but same user and program
    op_id2 = str(uuid.uuid4())
    res3 = client.post("/cards/issue", json={
        "user_id": mock_target_user.id,
        "program_id": mock_program.id,
        "operation_id": op_id2
    })
    assert res3.status_code == 409 # Conflict: active card already exists

    app.dependency_overrides.clear()

def test_issue_card_invalid_program(client, db_session, mock_business_user, mock_target_user):
    from src.main import app
    app.dependency_overrides[get_current_user] = lambda: mock_business_user

    # Program doesn't exist
    response = client.post("/cards/issue", json={
        "user_id": mock_target_user.id,
        "program_id": 9999,
        "operation_id": str(uuid.uuid4())
    })
    assert response.status_code == 404
    app.dependency_overrides.clear()
