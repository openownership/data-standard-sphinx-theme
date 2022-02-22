#!/bin/bash

set -e

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip python3-venv apache2 build-essential ruby-dev

mkdir -p /out
chown -R vagrant:users /out

pip3 install lxml html5lib gevent cchardet
pip3 install pylinkvalidator

cp /vagrant/vagrant/apache.conf /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart

curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
apt-get install -y nodejs
npm install -g grunt-cli

gem install sass

echo "alias build='/vagrant/vagrant/build.sh'" >> /home/vagrant/.bashrc

cd /vagrant/bootstrap_build && su vagrant -c "npm install"

cd /vagrant/data-standard && git submodule update --init
