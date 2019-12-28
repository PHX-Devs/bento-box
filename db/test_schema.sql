CREATE SCHEMA test;
GRANT ALL ON SCHEMA test TO bento;

CREATE TABLE test.entree(
    entree_id SERIAL,
    entree_name TEXT
);
GRANT ALL ON TABLE test.entree TO bento;
INSERT INTO test.entree (entree_name) VALUES('Chicken');
INSERT INTO test.entree (entree_name) VALUES('Beef');
INSERT INTO test.entree (entree_name) VALUES('Stew');