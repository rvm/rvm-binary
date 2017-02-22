#!/usr/bin/env bash

# Opensuse
if
  [[ -f /etc/os-release ]] &&
  GREP_OPTIONS="" \grep "ID=opensuse" /etc/os-release >/dev/null
then
  sed -i'' '/^127.0.0.1[[:space:]]*localhost$/ s/$/ '"$(hostname)"'/' /etc/hosts
fi

# Ubuntu
if
  which apt-get >/dev/null 2>&1
then
  apt-get --quiet --yes update
  apt-get --no-install-recommends --quiet --yes install bash curl
fi

# Arch
if
  [[ -s /etc/gemrc ]] &&
  grep -- '--user-install' /etc/gemrc >/dev/null
then
  sed -i'' -- '/--user-install/ d' /etc/gemrc
fi

# Fedora
if
  grep "^[^#]*requiretty" /etc/sudoers >/dev/null
then
  sed -E -i'' -e 's/(Defaults\s+requiretty)/#\1/' /etc/sudoers
fi

# Oracle
if
  [[ -f /etc/os-release ]] &&
  GREP_OPTIONS="" \grep 'ID="ol"' /etc/os-release >/dev/null
then
  yum install libyaml-devel -y --enablerepo ol7_optional_latest
fi

groups vagrant | grep rvm >/dev/null ||
  /usr/sbin/usermod -a -G rvm vagrant

true
