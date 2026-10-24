
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "project": "Azure Enterprise Platform Lab",
        "status": "Running",
        "message":"Version 2 deployed automatically through Azure DevOps CI/CD!"
    })

@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)

