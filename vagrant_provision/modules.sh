# root flask module
cp /var/www/flask-modules/root/root_app.service /etc/systemd/system/
systemctl daemon-reload
systemctl start root_app
systemctl enable root_app

# hello world module
cp /var/www/flask-modules/hello_world/hello_world.service /etc/systemd/system/
systemctl daemon-reload
systemctl start hello_world
systemctl enable hello_world

# example api module
cp /var/www/flask-modules/example_api/example_api.service /etc/systemd/system/
systemctl daemon-reload
systemctl start example_api
systemctl enable example_api
