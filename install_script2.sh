# RVM REQUIREMENTS

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash
/usr/local/rvm/bin/rvm requirements

# NGINX

cd /tmp

wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key

echo 'deb http://nginx.org/packages/debian/ jessie nginx'     >> /etc/apt/sources.list
echo 'deb-src http://nginx.org/packages/debian/ jessie nginx' >> /etc/apt/sources.list

apt-get update
apt-get install nginx

rm -rf ./nginx*
cd ~

# MYSQL

export DEBIAN_FRONTEND=noninteractive

debconf-set-selections <<< 'mysql-server mysql-server/root_password password qwerty12345'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password qwerty12345'

apt-get install mysql-server mysql-common mysql-client libmysqlclient-dev ruby-mysql -y

unset DEBIAN_FRONTEND

mysql -u root -pqwerty12345 -D mysql -r -B -N -e "CREATE USER 'rails'@'localhost' IDENTIFIED BY 'qwerty12345'"
mysql -u root -pqwerty12345 -D mysql -r -B -N -e "GRANT ALL PRIVILEGES ON hakushu_app.* TO 'rails'@'localhost' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0"
mysql -u root -pqwerty12345 -D mysql -r -B -N -e "SHOW GRANTS FOR 'rails'@'localhost'"

# PSQL

apt-get install postgresql-9.4 postgresql-server-dev-9.4 libpq-dev -y

#su - postgres
#psql -U postgres -c "CREATE USER rails WITH PASSWORD 'qwerty12345';"
#createdb -E UTF8 -O rails hakushu_app
#psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE hakushu_app TO rails;"

su -s /bin/bash -l postgres -c "psql -U postgres -c \"CREATE USER rails WITH PASSWORD 'qwerty12345';\""
su -s /bin/bash -l postgres -c "createdb -E UTF8 -O rails hakushu_app"
su -s /bin/bash -l postgres -c "psql -U postgres -c \"GRANT ALL PRIVILEGES ON DATABASE hakushu_app TO rails;\""

# SPHINX SEARCH

cd /tmp

wget http://sphinxsearch.com/files/sphinxsearch_2.2.10-release-1~jessie_amd64.deb
dpkg -i sphinxsearch_2.2.10-release-1~jessie_amd64.deb

rm -rf ./sphinxsearch*
cd ~

### RAILS USER ###

su - rails

echo 'export LC_ALL="en_US.UTF-8"'   >> ~/.bashrc
echo 'export LANGUAGE="en_US:en"'    >> ~/.bashrc
echo 'export LANG="en_US.UTF-8"'     >> ~/.bashrc
echo 'export LC_CTYPE="en_US.UTF-8"' >> ~/.bashrc

source ~/.bashrc

\curl -sSL https://get.rvm.io | bash
source ~/.bash_profile

rvm install ruby-2.2-head

logout
