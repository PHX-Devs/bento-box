# remove '/' location directive from base nginx.conf (now handled in /root/ module instead)
sed -ri '/location \//,/.*\}/d' /etc/nginx/nginx.conf

cp /var/www/modules/provision/static.conf /etc/nginx/default.d/

# start and enable nginx
systemctl start nginx
systemctl enable nginx

# make a special directory for sockets 
# (used by the uwsgi modules - do a quick search for '.sock' and you'll see how they're used)
mkdir /nginx_sockets
chown nginx:nginx /nginx_sockets