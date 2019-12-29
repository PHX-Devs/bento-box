from flask import Flask
application = Flask(__name__)

@application.route("/")
def index():
    return "<h1>Root flask app</h1>"

if __name__ == "__main__":
    application.run()