# BASE SOFT

apt-get update
apt-get install build-essential autoconf bison checkinstall curl git-core libodbc1 libc6-dev libreadline6 libreadline6-dev libsqlite3-0 libsqlite3-dev libssl-dev libxml2 libxml2-dev libxslt-dev libxslt1-dev libxslt1.1 libyaml-dev openssl sqlite3 zlib1g zlib1g-dev -y

# SET LANG VARS

echo 'export LC_ALL="en_US.UTF-8"'   >> ~/.bashrc
echo 'export LANGUAGE="en_US:en"'    >> ~/.bashrc
echo 'export LANG="en_US.UTF-8"'     >> ~/.bashrc
echo 'export LC_CTYPE="en_US.UTF-8"' >> ~/.bashrc

source ~/.bashrc

# ADD USER

adduser rails --home /home/rails --shell /bin/bash --disabled-password --gecos ''
echo "rails:qwerty12345" | chpasswd

# IMAGE MAGICK

apt-get install imagemagick libmagickwand-dev -y
convert --version

# REDIS

cd /tmp/

wget http://download.redis.io/releases/redis-3.0.5.tar.gz
tar -zxvf redis-3.0.5.tar.gz
cd /tmp/redis-3.0.5

make
checkinstall --pkgname=redis-server --pkgversion "3.0.5" --default

cd ..
rm -rf ./redis-3.0.5*
cd ~

# NODE

curl --silent --location https://deb.nodesource.com/setup_4.x | bash -
apt-get install nodejs -y

# IMAGE OPTIMIZERS

apt-get install gifsicle jhead jpegoptim libjpeg-progs optipng pngcrush pngquant -y

cd /tmp/

wget http://static.jonof.id.au/dl/kenutils/pngout-20150319-linux.tar.gz
tar -xvf pngout-20150319-linux.tar.gz
cp /tmp/pngout-20150319-linux/x86_64/pngout /usr/bin/pngout

rm -rf ./pngout-20150319*
cd ~
