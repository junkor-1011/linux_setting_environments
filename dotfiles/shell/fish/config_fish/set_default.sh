#!/bin/sh
set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}

if [ ! -f .config/fish/config_local.fish ]; then
    cp .config/fish/config_local.fish.template .config/fish/config_local.fish
else
    echo "PASS(already exist config_local.fish)"
fi

echo "Finished: cp config_local.fish.template to config_local.fish"
