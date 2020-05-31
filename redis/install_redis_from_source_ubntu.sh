#!/bin/bash

if [ "$(whoami)" != "root" ]; then
	echo "ERROR : Run script as Root (sudo !!) please"
	exit 1
fi

echo 'Installing redis stable release ... '

# installing build essentials if it is missing
apt-get install build-essential

wget http://download.redis.io/releases/redis-stable.tar.gz
tar xzf redis-$VERSION.tar.gz
cd redis-$VERSION
make
make install prefix=/usr/local/bin/
cp redis.conf /etc/redis.conf
cd ..
rm redis-$VERSION -R
rm redis-$VERSION.tar.gz

# create user and autostart
#useradd -r -s /bin/false redis
##wget -O /etc/init.d/redis-server https://gist.github.com/iJackUA/5336459/raw/4d7e4adfc08899dc7b6fd5d718f885e3863e6652/redis-server-for-init.d-startup
#touch /var/run/redis.pid
#chown redis:redis /var/run/redis.pid
#chmod 755 /etc/init.d/redis-server

# UNCOMMENT IF NEEDED to do autostart
# update-rc.d redis-server defaults