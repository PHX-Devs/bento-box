import sys
sys.path.append('..')
from utils.db import simple_query, delete_row, insert_row, update_row
from flask import Flask
from flask_restful import reqparse, abort, Api, Resource

application = Flask(__name__)
api = Api(application)

def abort_if_entree_doesnt_exist(entree_id):
    abort(404, message="Entre {} doesn't exist".format(entree_id))

entree_name_parser = reqparse.RequestParser()
entree_name_parser.add_argument('entree_name', trim=True, help='The name of the entree (a string). Error: {error_msg}')

# Entree
# shows a single entree item and lets you delete an entree item
class Entree(Resource):
    def get(self, entree_id):
        rows = simple_query('SELECT * FROM test.entree WHERE entree_id = :entree_id', {'entree_id': entree_id})
        if (len(rows) == 0):
            abort(404, message="Entree {} doesn't exist".format(entree_id))
        else:
            return rows[0]

    def delete(self, entree_id):
        rowcount = delete_row('DELETE FROM test.entree WHERE entree_id = :entree_id', {'entree_id': entree_id})
        if rowcount == 0:
            abort(404, message="Entree {} doesn't exist".format(entree_id))
        else:
            return '', 204

    def put(self, entree_id):
        args = entree_name_parser.parse_args()
        entree = {'entree_name': args['entree_name'], 'entree_id': entree_id}
        rowcount = update_row("UPDATE test.entree SET entree_name = :entree_name WHERE entree_id = :entree_id", entree)
        if (rowcount == 0):
            abort(404, message="Entree {} doesn't exist".format(entree_id))
        else:
            return entree, 201

# EntreeList
# shows a list of all entrees, and lets you POST to add new entrees
class EntreeList(Resource):
    def get(self):
        rows = simple_query('SELECT * FROM test.entree')
        return rows

    def post(self):
        args = entree_name_parser.parse_args()
        entree_name = args['entree_name']
        entree_id = insert_row("INSERT INTO test.entree (entree_name) VALUES (:entree_name) RETURNING entree_id", {'entree_name': entree_name})
        return {'entree_id': entree_id, 'entree_name': entree_name}, 201

##
## Actually setup the Api resource routing here
##
api.add_resource(EntreeList, '/entrees/')
api.add_resource(Entree, '/entrees/<entree_id>')

if __name__ == '__main__':
    application.run(debug=True)