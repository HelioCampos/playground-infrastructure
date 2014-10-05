#!/bin/bash

echo "[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1" > /tmp/mongodb.repo
sudo mv /tmp/mongodb.repo /etc/yum.repos.d/

sudo yum install -y mongo-10gen mongo-10gen-server >/dev/null 2>&1

echo "logpath=/var/log/mongodb/mongod.log
logappend=true
fork=true
port=27017
dbpath=/var/lib/mongo
pidfilepath=/var/run/mongodb/mongod.pid
bind_ip=0.0.0.0" > /tmp/mongod.conf
sudo mv /tmp/mongod.conf /etc/mongod.conf

sudo chkconfig mongod on >/dev/null 2>&1
sudo /sbin/service mongod restart

sudo yum install -y php-devel git httpd unzip >/dev/null 2>&1
sudo yum groupinstall -y 'Development Tools' >/dev/null 2>&1

sudo git clone https://github.com/mongodb/mongo-php-driver.git /tmp/mongo-php-driver >/dev/null 2>&1
cd /tmp/mongo-php-driver
sudo phpize >/dev/null 2>&1
sudo ./configure >/dev/null 2>&1
sudo make >/dev/null 2>&1
sudo make install >/dev/null 2>&1

sudo bash -c 'echo "extension=mongo.so" >> /etc/php.ini'

sudo wget http://rockmongo.com/downloads/go?id=12 -O /tmp/rockmongo.zip >/dev/null 2>&1
sudo mv /tmp/rockmongo.zip /var/www/html/

cd /var/www/html
sudo unzip rockmongo.zip >/dev/null 2>&1

sudo bash -c 'echo "ServerName vm-rmq-mdb.org" >> /etc/httpd/conf/httpd.conf'
sudo bash -c 'echo "127.0.0.1 localhost localhost.localdomain vm-rmq-mdb.org" > /etc/hosts'

sudo /sbin/service httpd restart
