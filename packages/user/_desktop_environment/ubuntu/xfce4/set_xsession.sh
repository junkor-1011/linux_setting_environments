#!/bin/sh
set -eux

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# .xsession
echo xfce4-session > ${HOME}/.xsession

# .xsessionrc
D=/usr/share/xfce4:/usr/share/xubuntu:/usr/local/share
D=${D}:/usr/share:/var/lib/snapd/desktop:/usr/share
cat <<EOF > ~/.xsessionrc
export XDG_SESSION_DESKTOP=xubuntu
export XDG_DATA_DIRS=${D}
export XDG_CONFIG_DIRS=/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg
EOF
