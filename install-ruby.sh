#!/usr/bin/env bash

PATH="/usr/local/rvm/bin:$PATH"

cd /vagrant

rvmsudo rvm uninstall "$1" --gems  &&
rvmsudo rvm install   "$1" --movable --autolibs=4 &&
rvmsudo rvm prepare   "$1" --path
