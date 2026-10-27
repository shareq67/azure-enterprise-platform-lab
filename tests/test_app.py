import unittest
from app.app import app


class AppTests(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_home_returns_project_details(self):
        response = self.client.get("/")
        self.assertEqual(response.status_code, 200)

        data = response.get_json()
        self.assertEqual(data["project"], "Azure Enterprise Platform Lab")
        self.assertEqual(data["status"], "Running")
        self.assertIn("message", data)

    def test_health_returns_healthy(self):
        response = self.client.get("/health")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.get_json(), {"status": "healthy"})


if __name__ == "__main__":
    unittest.main()