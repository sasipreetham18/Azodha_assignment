from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/health", methods=["GET"])
def health():
    return jsonify({"status": "ok"}), 200

@app.route("/predict", methods=["GET"])
def predict():
    # In real scenario, this would call ML model
    return jsonify({"score": 0.75}), 200

if __name__ == "__main__":
    # Bind to 0.0.0.0 so it works inside container
    app.run(host="0.0.0.0", port=8000)
