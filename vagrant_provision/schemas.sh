# test schema
runuser -l postgres -c "psql -f /var/www/flask-modules/db/create_database.sql"
runuser -l postgres -c "psql -U bento -f /var/www/flask-modules/db/test_schema.sql"