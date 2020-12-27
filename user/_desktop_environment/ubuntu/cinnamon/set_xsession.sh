#!/bin/sh
set -eux

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# .xsession
echo "cinnamon-session" > ~/.xsession

# .xsessionrc
D=/usr/share/gnome:/usr/share/cinnamon:/usr/local/share:/usr/share
D=${D}:/var/lib/snapd/desktop
C=/etc/xdg/xdg-cinnamon:/etc/xdg
cat <<EOF > ~/.xsessionrc
export XDG_SESSION_DESKTOP=cinnamon
export XDG_DATA_DIRS=${D}
export XDG_CONFIG_DIRS=${C}
EOF
