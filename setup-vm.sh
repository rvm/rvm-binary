#!/usr/bin/env bash

if
  ! [[ -f /etc/centos-release ]] ||
  ! GREP_OPTIONS="" \grep "root.*NOPASSWD" /etc/sudoers >/dev/null
then
  echo "root    ALL=(ALL)   NOPASSWD: ALL" >> /etc/sudoers
fi

[[ -s /etc/gemrc ]] && grep -- '--user-install' /etc/gemrc >/dev/null && sudo sed -i'' -- '/--user-install/ d' /etc/gemrc || true

which chef-client >/dev/null 2>&1 || sudo gem install chef --no-ri --no-rdoc --no-user-install || true

sudo sed -i'' '/^127.0.0.1[[:space:]]*localhost$/ s/$/ '"$(hostname)"'/' /etc/hosts || true
