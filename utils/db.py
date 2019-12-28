import sys
sys.path.append('..')
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy.sql import text
from config import conf

def simple_query(query_string, args={}):
    engine = create_engine(conf['db_string'])
    statement = text(query_string)
    with engine.connect() as connection:
        result = connection.execute(statement, args)

    results_list = []
    for row in result:
        results_list.append(dict(row.items()))
    return results_list

def delete_row(query_string, args={}):
    engine = create_engine(conf['db_string'])
    statement = text(query_string)
    with engine.connect() as connection:
        result = connection.execute(statement, args)
    return result.rowcount

def insert_row(query_string, args={}):
    engine = create_engine(conf['db_string'])
    statement = text(query_string)
    with engine.connect() as connection:
        result = connection.execute(statement, args)
    row = result.fetchone()
    return row[0]

def update_row(query_string, args={}):
    engine = create_engine(conf['db_string'])
    statement = text(query_string)
    with engine.connect() as connection:
        result = connection.execute(statement, args)
    return result.rowcount

if __name__ == "__main__":
    # test the methods...

    results = simple_query("SELECT * FROM test.entree")
    print("Found rows: %s" % results)

    inserted_id = insert_row("INSERT INTO test.entree (entree_name) VALUES ('Fake food') RETURNING entree_id")
    print("Inserted entree_id %d" % inserted_id)

    db_params = {'entree_id': inserted_id}

    updated_rows = update_row("UPDATE test.entree SET entree_name = 'Pasta' WHERE entree_id = :entree_id", db_params)
    print("Updated %d records." % updated_rows)

    deleted_rows = delete_row("DELETE FROM test.entree WHERE entree_id = :entree_id", db_params)
    print("Deleted %d records." % deleted_rows)



