import pytest
from fastapi.testclient import TestClient
from datetime import datetime, timezone, timedelta
from src.users.models import User, UserProfile
from src.businesses.models import Business
from src.programs.models import Program
from src.cards.models import Card
from src.activities.models import CardActivity
from src.sync.models import SyncOperation
import uuid

def mock_auth(client, db_session, is_user=True, is_business=False):
    # Create test user
    uid = str(uuid.uuid4())
    user = User(firebase_uid=uid, phone_number=f"+1{uuid.uuid4().hex[:10]}", is_user=is_user, is_business=is_business)
    db_session.add(user)
    db_session.commit()
    db_session.refresh(user)

    from src.auth.dependencies import get_current_user
    from src.main import app

    def override_get_current_user():
        return user

    app.dependency_overrides[get_current_user] = override_get_current_user
    return user

@pytest.fixture
def override_redis():
    import fakeredis
    import src.sync.service

    redis_mock = fakeredis.FakeStrictRedis()
    src.sync.service.redis_client = redis_mock
    yield redis_mock

def test_sync_push_success(client, db_session, override_redis):
    user = mock_auth(client, db_session)

    op_id = str(uuid.uuid4())
    push_data = {
        "operations": [
            {
                "operation_id": op_id,
                "action": "create",
                "entity_type": "profile",
                "payload": {
                    "display_name": "Test User",
                    "email": "test@example.com"
                },
                "timestamp": datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
            }
        ]
    }

    response = client.post("/sync/push", json=push_data)
    assert response.status_code == 200
    data = response.json()
    assert op_id in data["processed"]
    assert len(data["failed"]) == 0

    # Verify in DB
    profile = db_session.query(UserProfile).filter(UserProfile.user_id == user.id).first()
    assert profile is not None
    assert profile.display_name == "Test User"

    op = db_session.query(SyncOperation).filter(SyncOperation.operation_id == op_id).first()
    assert op is not None
    assert op.status == "success"

def test_sync_push_duplicate(client, db_session, override_redis):
    user = mock_auth(client, db_session)

    op_id = str(uuid.uuid4())
    push_data = {
        "operations": [
            {
                "operation_id": op_id,
                "action": "create",
                "entity_type": "profile",
                "payload": {
                    "display_name": "First Push",
                    "email": "test@example.com"
                },
                "timestamp": datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
            }
        ]
    }

    # First push
    response = client.post("/sync/push", json=push_data)
    assert response.status_code == 200

    # Change payload, same operation ID
    push_data["operations"][0]["payload"]["display_name"] = "Second Push"

    # Second push
    response = client.post("/sync/push", json=push_data)
    assert response.status_code == 200
    data = response.json()

    # It should be processed (idempotent skip)
    assert op_id in data["processed"]

    # Payload should NOT be updated because it skipped
    profile = db_session.query(UserProfile).filter(UserProfile.user_id == user.id).first()
    assert profile.display_name == "First Push"

def test_sync_pull_updated_since(client, db_session):
    user = mock_auth(client, db_session)

    # Create profile
    profile = UserProfile(user_id=user.id, display_name="Test Profile")
    db_session.add(profile)
    db_session.commit()

    # Time before the update
    updated_since = (datetime.now(timezone.utc) - timedelta(minutes=1)).isoformat().replace("+00:00", "Z")

    response = client.get(f"/sync/pull?updated_since={updated_since}")
    assert response.status_code == 200
    data = response.json()

    assert len(data["profiles"]) == 1
    assert data["profiles"][0]["display_name"] == "Test Profile"
    assert len(data["cards"]) == 0

    # Future timestamp
    future_time = (datetime.now(timezone.utc) + timedelta(minutes=10)).isoformat().replace("+00:00", "Z")
    response = client.get(f"/sync/pull?updated_since={future_time}")
    data = response.json()
    assert len(data["profiles"]) == 0

def test_sync_conflict_resolution(client, db_session, override_redis):
    user = mock_auth(client, db_session)

    # Create profile
    profile = UserProfile(user_id=user.id, display_name="Old Profile")
    db_session.add(profile)
    db_session.commit()

    # Let's say profile was updated 5 minutes ago
    from sqlalchemy import text
    db_session.execute(text(f"UPDATE user_profiles SET updated_at = datetime('now', '-5 minutes') WHERE id = {profile.id}"))
    db_session.commit()

    op_id1 = str(uuid.uuid4())
    push_data_stale = {
        "operations": [
            {
                "operation_id": op_id1,
                "action": "update",
                "entity_type": "profile",
                "payload": {
                    "display_name": "Stale Update"
                },
                "timestamp": (datetime.now(timezone.utc) - timedelta(minutes=10)).isoformat().replace("+00:00", "Z")
            }
        ]
    }

    # Stale push
    response = client.post("/sync/push", json=push_data_stale)
    assert response.status_code == 200

    profile = db_session.query(UserProfile).filter(UserProfile.user_id == user.id).first()
    assert profile.display_name == "Old Profile" # Should remain unchanged

    op_id2 = str(uuid.uuid4())
    push_data_fresh = {
        "operations": [
            {
                "operation_id": op_id2,
                "action": "update",
                "entity_type": "profile",
                "payload": {
                    "display_name": "Fresh Update"
                },
                "timestamp": (datetime.now(timezone.utc) + timedelta(minutes=1)).isoformat().replace("+00:00", "Z")
            }
        ]
    }

    # Fresh push
    response = client.post("/sync/push", json=push_data_fresh)
    assert response.status_code == 200

    profile = db_session.query(UserProfile).filter(UserProfile.user_id == user.id).first()
    assert profile.display_name == "Fresh Update" # Should change

def test_sync_tenant_isolation(client, db_session, override_redis):
    # Create user A
    userA = mock_auth(client, db_session)

    # Create user B manually
    uidB = str(uuid.uuid4())
    userB = User(firebase_uid=uidB, phone_number=f"+1{uuid.uuid4().hex[:10]}", is_user=True, is_business=False)
    db_session.add(userB)

    program = Program(name="Test Prog", business_id=1) # dummy biz id
    db_session.add(program)
    db_session.commit()

    cardB = Card(user_id=userB.id, program_id=program.id)
    db_session.add(cardB)
    db_session.commit()

    # User A tries to add activity to User B's card
    op_id = str(uuid.uuid4())
    push_data = {
        "operations": [
            {
                "operation_id": op_id,
                "action": "create",
                "entity_type": "activity",
                "payload": {
                    "card_id": cardB.id,
                    "points_added": 100,
                    "description": "Hack"
                },
                "timestamp": datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
            }
        ]
    }

    response = client.post("/sync/push", json=push_data)
    assert response.status_code == 200
    data = response.json()
    assert op_id in data["failed"]

    op = db_session.query(SyncOperation).filter(SyncOperation.operation_id == op_id).first()
    assert op.status == "failed"
    assert "Not authorized" in op.error_message
