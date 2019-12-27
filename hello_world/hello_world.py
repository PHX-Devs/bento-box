from flask import Flask
application = Flask(__name__)
@application.route("/")
def hello():
    return '''
    <h1 style='color:red'>Hello World</h1>
    <p>This is a sample flask app served at /hello_world/.</p>
    <p>
    Create more like it by copying the following:
    <ul>
    <li>Copy hello_world dir, change hello_world references.</li>
    <li>Edit /vagrant_provision/modules.sh and add a few lines</li>
    <li>Copy/paste hello_world.conf in /nginx_confs/, edit accordingly</li>
    </ul>
    </p>   
    '''

if __name__ == "__main__":
    application.run()