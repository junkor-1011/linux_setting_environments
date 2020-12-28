#!/bin/sh
# execute by root
set -eux

# requirement: xrdp, ubuntu-desktop

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# backup
cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bk_$(date "+%Y-%m-%dT%H:%M:%S")

# xrdp.ini
cp ${SCRIPT_DIR}/xrdp.ini /etc/xrdp/xrdp.ini

# service
service xrdp start


# startwm
# backup
cp /etc/xrdp/startwm.sh /etc/xrdp/startwm.sh.bk_$(date "+%Y-%m-%dT%H:%M:%S")
cp ${SCRIPT_DIR}/startwm.sh /etc/xrdp/startwm.sh

echo "INFO: finished xrdp-setting for wsl2"
