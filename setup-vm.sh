#!/usr/bin/env bash

# Opensuse
if
  [[ -f /etc/os-release ]] &&
  GREP_OPTIONS="" \grep "ID=opensuse" /etc/os-release >/dev/null
then
  sudo sed -i'' '/^127.0.0.1[[:space:]]*localhost$/ s/$/ '"$(hostname)"'/' /etc/hosts
fi

# Ubuntu
if
  which apt-get >/dev/null 2>&1
then
  sudo apt-get --quiet --yes update
  sudo apt-get --no-install-recommends --quiet --yes install bash curl
fi

# Arch
[[ -s /etc/gemrc ]] && grep -- '--user-install' /etc/gemrc >/dev/null && sudo sed -i'' -- '/--user-install/ d' /etc/gemrc

true
