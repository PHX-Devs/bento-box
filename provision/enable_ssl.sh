mkdir -p /etc/pki/nginx/private
chmod 700 /etc/pki/nginx
chmod 700 /etc/pki/nginx/private
cd /etc/pki/nginx
printf '\n\n\n\n\n\n\n' | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/nginx/private/nginx-selfsigned.key -out /etc/pki/nginx/nginx-selfsigned.crt
echo "Generating DH parameters, this will take a while."
openssl dhparam -out /etc/pki/nginx/dhparam.pem 2048 > /dev/null 2>&1
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak 
cp /var/www/modules/provision/nginx_conf /etc/nginx/nginx.conf -f
systemctl restart nginx