#!/bin/sh
set -eux

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# .xsession
if [ -f ${HOME}/.xsession ]; then
    rm ${HOME}/.xsession
fi

# .xsessionrc
D=/usr/share/ubuntu:/usr/local/share:/usr/share:/var/lib/snapd/desktop
cat <<EOF > ~/.xsessionrc
export GNOME_SHELL_SESSION_MODE=ubuntu
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export XDG_DATA_DIRS=${D}
export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
EOF
