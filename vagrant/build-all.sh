#!/bin/bash

set -e

####################### Bootstrap

cp /vagrant/bootstrap_build/src/_variables.scss  /vagrant/bootstrap_build/bootstrap/scss/_variables.scss

cd /vagrant/bootstrap_build && grunt sass

cp /vagrant/bootstrap_build/bootstrap/dist/js/bootstrap.* /vagrant/oods/sphinxtheme/static/bootstrap-4.0.0/js/

####################### Sphinx

export PYTHONPATH=$PYTHONPATH:/vagrant/

cd /vagrant/data-standard

if [ ! -d "/vagrant/data-standard/.ve" ]
then
    virtualenv .ve -p python3
fi

source .ve/bin/activate
pip3 install -r requirements.txt
sphinx-build  -a /vagrant/data-standard/docs   /out/
deactivate

####################### Link Checker

if [ -f "/tmp/report.txt" ]
then
    # remove so we are certain the data we echo to the user is from this run, and not a previous run
    rm /tmp/report.txt
fi
pylinkvalidate.py --output=/tmp/report.txt   http://localhost/ || true
cat /tmp/report.txt
