# test schema
runuser -l postgres -c "psql -f /var/www/modules/db/create_database.sql"
runuser -l postgres -c "psql -U bento -f /var/www/modules/db/test_schema.sql"