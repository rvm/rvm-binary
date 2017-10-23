#!/bin/bash
set -e
INSTALL_PKGS="which"
yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS
rpm -V $INSTALL_PKGS
yum clean all -y
