#!/usr/bin/env sh
# execute by root
set -eu

apt-get -y install ubuntu-desktop

# tweak-tools
apt-add-repository universe
apt-get -y update
apt-get -y install gnome-tweak-tool

# remote-desktop
apt-get -y install \
    xrdp \
    remmina
