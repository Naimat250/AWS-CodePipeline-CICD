# app.py

from flask import Flask

app = Flask(__name__)

# Route for homepage
@app.route('/')
def index():
    return "Hello, World!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

