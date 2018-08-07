#!/bin/bash

set -e

cp /vagrant/bootstrap_build/src/_variables.scss  /vagrant/bootstrap_build/bootstrap/scss/_variables.scss

cd /vagrant/bootstrap_build && grunt sass

cp /vagrant/bootstrap_build/bootstrap/dist/js/bootstrap.* /vagrant/oods/sphinxtheme/static/bootstrap-4.0.0/js/

export PYTHONPATH=$PYTHONPATH:/vagrant/

sphinx-build  -a /vagrant/data-standard/docs   /out/

# remove so we are certain the data we echo to the user is from this run, and not a previous run
rm /tmp/report.txt
pylinkvalidate.py --output=/tmp/report.txt   http://localhost/ || true
cat /tmp/report.txt
