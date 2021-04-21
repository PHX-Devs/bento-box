runuser -l postgres -c '/usr/pgsql-13/bin/initdb /var/lib/pgsql/13/data'

systemctl start postgresql-13
systemctl enable postgresql-13
