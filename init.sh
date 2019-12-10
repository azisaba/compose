#!/bin/bash

set -eux

dnf -y config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf -y install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
dnf -y install docker-ce

curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod -c +x /usr/local/bin/docker-compose
