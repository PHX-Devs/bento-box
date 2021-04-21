import sys
sys.path.append('..')
from flask import Flask, render_template
from utils.db import simple_query

application = Flask(__name__)

@application.route("/")
def hello():
    # an example that doesn't use a template
    return '''
    <h1 style='color:red'>Hello World</h1>
    <p>This is a sample flask app served at /hello_world/.</p>
    <p>
    Create more like it by copying the following:
    <ul>
    <li>Copy hello_world dir, change hello_world references.</li>
    <li>Edit /provision/modules.sh and add a few lines</li>
    <li>Copy/paste hello_world.conf in /nginx_confs/, edit accordingly</li>
    </ul>
    </p>
    <h2>Another example page</h2>
    <p><a href="/hello_world/entrees/">Entrees</a></p>
    '''

@application.route("/entrees/")
def entrees():
    # an example that fetches data using the database util (utils/db.py)
    rows = simple_query('SELECT * FROM test.entree')
    # also an example that renders a template
    return render_template('entrees.html', title='Entrees', entrees=rows)

if __name__ == "__main__":
    application.run()