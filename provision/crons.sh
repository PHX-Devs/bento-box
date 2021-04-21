cp /var/www/modules/crons/crontab /var/spool/cron/root
# array of crons to install on the system
crons=()
crons+=(example_cron)
# add a new cron by adding a line here
#crons+=(your_new_cron_here)

for cron_name in "${crons[@]}"
do
    mkdir /var/log/${cron_name}
    touch /var/log/${cron_name}/${cron_name}.log
    cp /var/www/modules/crons/${cron_name}/${cron_name}.logrotate /etc/logrotate.d/${cron_name}
done 