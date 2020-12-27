#!/bin/sh
# execute by root
set -eux

apt-get -y install \
    mate-desktop \
    mate-desktop-environment \
    mate-desktop-environment-extra \
    mate-session-manager
