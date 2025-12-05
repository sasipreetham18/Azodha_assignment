import json
from app.main import app

def test_health():
    client = app.test_client()
    resp = client.get("/health")
    assert resp.status_code == 200
    data = json.loads(resp.data)
    assert data["status"] == "ok"

def test_predict():
    client = app.test_client()
    resp = client.get("/predict")
    assert resp.status_code == 200
    data = json.loads(resp.data)
    assert "score" in data

