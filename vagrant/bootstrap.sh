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

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs
npm install -g grunt-cli

gem install sass

echo "alias build-all='/vagrant/vagrant/build-all.sh'" >> /home/vagrant/.bashrc
echo "alias build-sphinx='/vagrant/vagrant/build-sphinx.sh'" >> /home/vagrant/.bashrc

cd /vagrant/bootstrap_build && npm install

cd /vagrant/data-standard && git submodule update --init
