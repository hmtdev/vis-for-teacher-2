from app import app
from flask import jsonify

@app.route('/', methods=['GET'])
def index():
    return jsonify(msg="Hello world")

@app.route('/ok/<string:ok>', methods=['GET'])
def ok(ok):
    return jsonify(ok=ok)