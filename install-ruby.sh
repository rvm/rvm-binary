#!/usr/bin/env bash

PATH="/usr/local/rvm/bin:$PATH"

cd /vagrant

rvm uninstall --gems "$1" &&
rvmsudo rvm   --autolibs=4 requirements "$1" &&
rvm --movable --autolibs=1 install      "$1" &&
rvm prepare   --path "$1"
