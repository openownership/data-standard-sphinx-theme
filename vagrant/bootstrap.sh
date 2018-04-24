#!/bin/bash

set -e

apt-get update
apt-get install -y python3 python3-pip apache2 build-essential ruby-dev

pip3 install virtualenv recommonmark sphinx==1.5.6

mkdir /out
chown -R vagrant:users /out

cp /vagrant/vagrant/apache.conf /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs
npm install -g grunt-cli

gem install sass

if [ ! -d /vagrant/bootstrap_build/bootstrap ]; then
    git clone --branch v4.0.0  https://github.com/twbs/bootstrap.git  /vagrant/bootstrap_build/bootstrap
fi

echo "alias build-all='/vagrant/vagrant/build-all.sh'" >> /home/vagrant/.bashrc

cd /vagrant/bootstrap_build && npm install

cd /vagrant/data-standard && git submodule update --init
