#!/usr/bin/env bash

installer_options=( --auto-dotfiles --path /usr/local/rvm )

if
  [[ -d "/vagrant/rvm-src" ]]
then
  cd "/vagrant/rvm-src"
  ./install "${installer_options[@]}"
  echo "source" > /usr/local/rvm/RELEASE
else
  echo "rvm-src not found falling back to download" >&2
  curl -L https://get.rvm.io | bash -s -- "${installer_options[@]}"
fi

rm -rf /usr/local/rvm/user/*
/usr/local/rvm/bin/rvm gemset globalcache enable

for type in archives repos gems/cache
do
  if
    [[ -d /vagrant/rvm-${type//\//-} ]]
  then
    mkdir -p /usr/local/rvm/${type%/*} &&
    rm -rf /usr/local/rvm/${type} &&
    ln -s /vagrant/rvm-${type//\//-}/ /usr/local/rvm/${type}
  else
    echo "rvm-${type} missing, shared ${type} disabled" >&2
  fi
done
