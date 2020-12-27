#!/bin/sh
# execute by root
set -eux

# requirement: xrdp

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# backup
cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bk_$(date "+%Y-%m-%dT%H:%M:%S")

# change port 3389(default) -> 3390
# (in wsl2, 3389 is not available for xrdp...)
sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
# cursor
sed -i 's/new_cursors=true/new_cursors=false/g' /etc/xrdp/xrdp.ini
# color setting
sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini

# service
service xrdp start

cat <<EOL > ~/.xsessionrc
export GNOME_SHELL_SESSION_MODE=ubuntu
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export XDG_DATA_DIRS=/usr/share/ubuntu:/usr/local/share:/usr/share:/var/lib/snapd/desktop
export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
EOL

echo "INFO: finished xrdp-setting for wsl2"
