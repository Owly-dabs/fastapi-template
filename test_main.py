from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Wikipedia Fetcher API! Call /search or /wiki"}


def test_read_phrase():
    response = client.get("/phrase/Jasmine")
    assert response.status_code == 200
    assert response.json() == {
        "result": [
            "jasmine",
            "botanical name",
            "jasminum",
            "yas-min-əm",
            "olive family",
            "oleaceae"
        ]
    }
    

def test_read_search():
    response = client.get("/search/jasmine")
    assert response.status_code == 200
    assert "Jasmine" in response.json()["result"]
    assert "Jasmine rice" in response.json()["result"]
    assert "Jasmine (disambiguation)" in response.json()["result"]