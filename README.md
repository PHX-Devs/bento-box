# bento-box
A flask developer's box of goodies.

## Vagrant setup
1. make sure you have Vagrant and Virtualbox installed
2. open terminal/cmd in this dir
3. vagrant up

## Putty setup (optional)
1. convert ./.vagrant/machines/default/virtualbox/private_key to putty key (use puttygen)
2. configure putty to use 'vagrant' user, converted private key, port 2222

## Vagrant up gets you...
* centos8
* all rpms updated
* python36 installed
* flask installed
* postgres 12 and postgis 3 installed
    * also a starter database called 'bento' 
* migra installed
* empty 'root_app' module listening on the '/' path
* hello world flask app installed and congured in nginx
* example api module installed (with an actual database schema behind it)

## To create a new module:
**for the sake of example, we'll act like we're adding a module named 'carbs'
1. create a new dir in the root of this repo (/carbs/)
2. make sure it has the following (probably best to copy one of the examples)
    * \_\_init\_\_.py (empty - if you're reading this in an editor... otherwise known as __init__.py)
    * carbs.py (main flask app here)
    * carbs.ini (uwsgi config items)
    * carbs.service (systemd service file)
    * wsgi.py (boilerplate - a bootstrapper for uwsgi to point to)
    * carbs.conf (nginx config file - be sure to change a few references)
    * ./templates/ dir (optional, if your module has a web ui)
**If copy/pasting, make sure to review each of the above files
3. add a line to /vagrant_provision/modules.sh for your new carbs module
    * will run next time your vagrant box provisions
    * to run the provision step manually (just for your module), comment out accordingly and run modules.sh
    * this step:
        * installs your module as a uwsgi proc running as a service
        * adds the nginx config to the appropriate dir
    * systemctl command will match the filename of your .service file (systemctl start carbs)
4. restart nginx
    * 'systemctl restart nginx

## To create a new db schema:
**for the sake of example, we'll act like we're adding a schema named 'carbs'
1. add a schema create file in the db dir (/db/carbs_schema.sql)
    * this file should start with 'CREATE SCHEMA carbs;'
2. add a line to /vagrant_provision/schemas.sh
    * runuser -l postgres -c "psql -U bento -f /var/www/flask-modules/db/carbs_schema.sql"
    * note: this will install the carbs schema to the bento database - if you've created your own database, use that

### Note on db versioning/migrations
Bento Box does not solve for db versioning at the moment. But it does include migra, a db diff tool. That's a good start toward a sane db "non-versioning" scheme.
Read up on it here: https://djrobstep.com/docs/migra/quickstart