# array of module names to install on the system
modules=()
modules+=(root_app)
modules+=(hello_world)
modules+=(example_api)
# add your new module by adding a line here
#modules+=(your_new_module_here)

mkdir -p /var/www/modules

for module_name in "${modules[@]}"
do
    # install the nginx conf file (nginx will load /etc/nginx/default.d/*.conf by default)
    cp /var/www/modules/${module_name}/${module_name}.conf /etc/nginx/default.d/
    # install the service file to the systemd dir
    cp /var/www/modules/${module_name}/${module_name}.service /etc/systemd/system/
    # reload to make systemctl see the new service
    systemctl daemon-reload
    # start the service
    systemctl start $module_name
    # enable the service (so it starts automatically on boot)
    systemctl enable $module_name
done

# restart nginx to load the new conf files
systemctl restart nginx

