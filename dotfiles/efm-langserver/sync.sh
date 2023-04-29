#!/bin/sh
set -eu

SCRIPT_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"
cd "${SCRIPT_DIR}"

if [ ! -d "${HOME}/.config/efm-langserver" ]; then
    mkdir -p "${HOME}/.config/efm-langserver"
fi

if [ "$1" = "link" ]; then
    ln -sfv "$(pwd)/config.yaml" "${HOME}/.config/efm-langserver/config.yaml"
else
    echo "wrong argument"
fi
