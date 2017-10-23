#!/bin/bash
set -e
apt-get update -qq
apt-get install -y --reinstall curl gnupg2 dirmngr
apt-get clean
rm -rf /var/lib/apt/lists/*
