# install goodies
dnf update -y
dnf install -y python3-sqlalchemy python36 python3-flask nginx python3-devel
pip3 install uwsgi
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
dnf -qy module disable postgresql
dnf install -y postgis30_12 --enablerepo=PowerTools