#!/bin/bash

set -e

function detect_ruby_version() {
  if [ "$RUBY_VERSION" != "" ]; then
    echo "Using ruby from RUBY_VERSION environment variable: $RUBY_VERSION"
  else
    echo "No RUBY_VERSION found in environment, please set and run again"
    exit 1
  fi
}

function install_rvm() {
  echo progress-bar >> ~/.curlrc
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
  curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc
  gpg --verify rvm-installer.asc
  bash rvm-installer stable
  export PATH=$PATH:/usr/local/rvm/bin
  source /etc/profile.d/rvm.sh
  rvm autolibs packages
}

function install_ruby() {
  rvm install --movable "$1"
  cd /ruby-binaries
  rvm prepare --path "$1"
}

/usr/bin/prepare-system.sh
detect_ruby_version
install_rvm
install_ruby $RUBY_VERSION
