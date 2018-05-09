#!/bin/bash

set -e

export PYTHONPATH=$PYTHONPATH:/vagrant/

sphinx-build  -a /vagrant/data-standard/docs   /out/

