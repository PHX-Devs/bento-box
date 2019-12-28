runuser -l postgres -c '/usr/pgsql-12/bin/initdb /var/lib/pgsql/12/data'

systemctl start postgresql-12
systemctl enable postgresql-12
