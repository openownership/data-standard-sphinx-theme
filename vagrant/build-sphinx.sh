#!/bin/bash

set -e

export PYTHONPATH=$PYTHONPATH:/vagrant/python

sphinx-build  -a /vagrant/data-standard/docs   /out/

