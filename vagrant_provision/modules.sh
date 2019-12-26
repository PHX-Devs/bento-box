# hello world module
cp /var/www/flask-modules/hello_world/hello_world.service /etc/systemd/system/
systemctl start hello_world
systemctl enable hello_world

# remove old include lines if they exist, then add the new config line to the nginx conf
# this is just a "fun" way to ensure that we add the config the first time, but also don't 
# add it more than once
sed -i '/include\ \/var\/www\/flask-modules\/nginx_confs\/\*.conf;/d' /etc/nginx/nginx.conf
sed -i '/\/etc\/nginx\/conf.d\/\*.conf/a\ \ \ \ include /var/www/flask-modules/nginx_confs/*.conf;' /etc/nginx/nginx.conf

systemctl start nginx
systemctl enable nginx

mkdir /nginx_sockets
chown nginx:nginx /nginx_sockets