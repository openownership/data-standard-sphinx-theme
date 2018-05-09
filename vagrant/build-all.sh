#!/bin/bash

set -e

cp /vagrant/bootstrap_build/src/_variables.scss  /vagrant/bootstrap_build/bootstrap/scss/_variables.scss

cd /vagrant/bootstrap_build && grunt sass

cp /vagrant/bootstrap_build/bootstrap/dist/js/bootstrap.* /vagrant/themes/oods/static/bootstrap-4.0.0/js/

export PYTHONPATH=$PYTHONPATH:/vagrant/

sphinx-build  -a /vagrant/data-standard/docs   /out/

