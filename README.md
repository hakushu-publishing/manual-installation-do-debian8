## Hakushu. Manual installation: Digital Ocean + Debian 8.1

```sh
apt-get update

apt-get install build-essential autoconf bison checkinstall curl git-core libc6-dev libreadline6 libreadline6-dev libsqlite3-0 libsqlite3-dev libssl-dev libxml2 libxml2-dev libxslt-dev libxslt1-dev libxslt1.1 libyaml-dev openssl sqlite3 zlib1g zlib1g-dev -y

apt-get install imagemagick libmagickwand-dev -y
convert --version

cd /tmp/
wget http://download.redis.io/releases/redis-3.0.5.tar.gz
tar -zxvf redis-3.0.5.tar.gz
cd /tmp/redis-3.0.5
make
checkinstall --pkgname=redis-server --pkgversion "3.0.5" --default
cd ..
rm -rf ./redis-3.0.5*

cd /tmp/
wget https://nodejs.org/download/release/latest/node-v4.2.1.tar.gz
tar -zxvf node-v4.2.1.tar.gz
cd node-v4.2.1/
./configure && make
checkinstall --pkgname=nodejs --pkgversion "4.2.1" --default
cd ..
rm -rf ./node-v4.2.1*
```
