#!/usr/bin/env bash

export PATH="/usr/local/rvm/bin:$PATH"

cd /vagrant

rvm uninstall --gems    "$1" &&
rvm install   --movable "$1" --autolibs=4 &&
rvm prepare   --path    "$1"
