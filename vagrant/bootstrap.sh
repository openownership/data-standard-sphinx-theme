#!/bin/bash

set -e

apt-get update
apt-get install -y python3 python3-pip apache2 build-essential ruby-dev

cd /vagrant && pip3 install -r requirements.txt

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

if [ ! -d /vagrant/bootstrap_build/bootstrap ]; then
    git clone --branch v4.0.0  https://github.com/twbs/bootstrap.git  /vagrant/bootstrap_build/bootstrap
fi

echo "alias build-all='/vagrant/vagrant/build-all.sh'" >> /home/vagrant/.bashrc
echo "alias build-sphinx='/vagrant/vagrant/build-sphinx.sh'" >> /home/vagrant/.bashrc

cd /vagrant/bootstrap_build && npm install

cd /vagrant/data-standard && git submodule update --init
