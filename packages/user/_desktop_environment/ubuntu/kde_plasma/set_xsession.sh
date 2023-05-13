#!/bin/sh
set -eux

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# .xsession
echo "startkde" > ~/.xsession

# .xsessionrc
D=/usr/share/plasma:/usr/local/share:/usr/share:/var/lib/snapd/desktop
C=/etc/xdg/xdg-plasma:/etc/xdg
C=${C}:/usr/share/kubuntu-default-settings/kf5-settings
cat <<EOF > ~/.xsessionrc
export XDG_SESSION_DESKTOP=KDE
export XDG_DATA_DIRS=${D}
export XDG_CONFIG_DIRS=${C}
EOF
