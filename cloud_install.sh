# run from /var/www/flask-modules
/usr/bin/sh ./vagrant_provision/packages.sh
/usr/bin/sh ./vagrant_provision/dev_env.sh
/usr/bin/sh ./vagrant_provision/nginx.sh
/usr/bin/sh ./vagrant_provision/postgres.sh
/usr/bin/sh ./vagrant_provision/modules.sh
/usr/bin/sh ./vagrant_provision/schemas.sh
/usr/bin/sh ./vagrant_provision/crons.sh
