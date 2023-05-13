#!/usr/bin/env sh
set -eux

# SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"

if [ ! -x /usr/bin/python3 ]; then
    echo "(NO ACTION)There is no /usr/bin/python3, skip it."
    exit
fi

# install
/usr/bin/python3 -m pip install podman-compose --user --no-cache-dir -U

echo "INFO: finished."
