#!/bin/bash

set -e

export PYTHONPATH=$PYTHONPATH:/vagrant/

sphinx-build  -a /vagrant/data-standard/docs   /out/

pylinkvalidate.py --output=/tmp/report.txt   http://localhost/ || true
cat /tmp/report.txt
