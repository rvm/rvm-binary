#!/usr/bin/env bash

export PATH="/usr/local/rvm/bin:$PATH"
export rvmsudo_secure_path=1

cd /vagrant

rvm uninstall --gems "$1" &&
rvmsudo rvm   --autolibs=4 requirements "$1" &&
rvm --movable --autolibs=1 install      "$1" &&
rvm prepare   --path "$1"
