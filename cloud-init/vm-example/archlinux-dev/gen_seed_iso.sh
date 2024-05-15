#!/bin/bash
set -euxo pipefail

# prerequisite: genisoimage
# ex) apt install genisoimage

SCRIPT_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"
cd "$SCRIPT_DIR"

NOFILE="false"

if [ ! -f "$(pwd)/user-data" ]; then
    echo "[ERROR]There is no user-data file."
    NOFILE="true"
fi

if [ ! -f "$(pwd)/meta-data" ]; then
    echo "[ERROR]There is no meta-data file."
    NOFILE="true"
fi

if [ $NOFILE == "true" ]; then
    exit 1
fi

mkisofs -output seed.iso -volid cidata -joliet -rock user-data meta-data

echo "Done!"
