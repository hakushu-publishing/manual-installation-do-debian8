## Hakushu. Manual installation: Digital Ocean + Debian 8.1

```sh
apt-get update

apt-get install build-essential autoconf bison checkinstall curl git-core libc6-dev libreadline6 libreadline6-dev libsqlite3-0 libsqlite3-dev libssl-dev libxml2 libxml2-dev libxslt-dev libxslt1-dev libxslt1.1 libyaml-dev openssl sqlite3 zlib1g zlib1g-dev -y
```

```sh
apt-get install imagemagick libmagickwand-dev -y
convert --version
```

```sh
adduser rails --home /home/rails --shell /bin/bash --disabled-password --gecos ''
echo "rails:qwerty12345" | chpasswd
```

```sh
cd /tmp/
wget http://download.redis.io/releases/redis-3.0.5.tar.gz
tar -zxvf redis-3.0.5.tar.gz
cd /tmp/redis-3.0.5
make
checkinstall --pkgname=redis-server --pkgversion "3.0.5" --default
cd ..
rm -rf ./redis-3.0.5*
```

```sh
cd /tmp/
wget https://nodejs.org/download/release/latest/node-v4.2.1.tar.gz
tar -zxvf node-v4.2.1.tar.gz
cd node-v4.2.1/
./configure && make
checkinstall --pkgname=nodejs --pkgversion "4.2.1" --default
cd ..
rm -rf ./node-v4.2.1*
```

```sh
export DEBIAN_FRONTEND=noninteractive
printenv DEBIAN_FRONTEND

debconf-set-selections <<< 'mysql-server mysql-server/root_password password qwerty12345'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password qwerty12345'

apt-get install mysql-server mysql-common mysql-client libmysqlclient-dev ruby-mysql -y

unset DEBIAN_FRONTEND
printenv DEBIAN_FRONTEND

mysql --version

mysql -u root -pqwerty12345 -D mysql -r -B -N -e "CREATE USER 'rails'@'localhost' IDENTIFIED BY 'qwerty12345'"

mysql -u root -pqwerty12345 -D mysql -r -B -N -e "GRANT ALL PRIVILEGES ON hakushu_app.* TO 'rails'@'localhost' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0"

mysql -u root -pqwerty12345 -D mysql -r -B -N -e "SHOW GRANTS FOR 'rails'@'localhost'"
```

```sh
apt-get install postgresql-9.4 postgresql-server-dev-9.4 libpq-dev
psql --version

su - postgres
psql -U postgres -c "CREATE USER rails WITH PASSWORD 'qwerty12345';"
createdb -E UTF8 -O rails hakushu_app
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE hakushu_app TO rails;"
exit

# psql -U rails -d hakushu_app -h localhost
```

```sh
apt-get install gifsicle jhead jpegoptim libjpeg-progs optipng pngcrush pngquant -y

cd /tmp/
wget http://static.jonof.id.au/dl/kenutils/pngout-20150319-linux.tar.gz
tar -xvf pngout-20150319-linux.tar.gz
cp /tmp/pngout-20150319-linux/x86_64/pngout /usr/bin/pngout
rm -rf ./pngout-20150319*
cd ~

# gifsicle --version
# jhead  -V
# jpegoptim --version
# jpegtran -V
# optipng --version
# pngcrush --version
# pngout
```
