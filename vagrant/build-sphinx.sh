#!/bin/bash

set -e

export PYTHONPATH=$PYTHONPATH:/vagrant/

sphinx-build  -a /vagrant/data-standard/docs   /out/


# remove so we are certain the data we echo to the user is from this run, and not a previous run
rm /tmp/report.txt
pylinkvalidate.py --output=/tmp/report.txt   http://localhost/ || true
cat /tmp/report.txt
