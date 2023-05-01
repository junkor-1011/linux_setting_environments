#!/usr/bin/env bash
set -eu

# get script path
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR"

VERSION=v0.10.11
OS="$(uname)"
_Arch="$(arch)"
if [ "$_Arch" = "x86_64" ]; then
    Arch="amd64"
else
    echo "arch is $_Arch, only support x86_64"
    exit 1
fi

echo "Let's Install evans ver: ${VERSION}, please check if there is newer version."

INSTALL_PATH="${HOME}/LocalApps"
EXECUTE_PATH="${HOME}/bin"

if [ ! -d "${INSTALL_PATH}" ]; then
    mkdir -p "${INSTALL_PATH}"
fi
if [ ! -d "${EXECUTE_PATH}" ]; then
    mkdir -p "${EXECUTE_PATH}"
fi

if [ -d tmp ]; then
    rm -rf tmp
fi
mkdir tmp
cd tmp

PKG_TGZ_FILE="evans_${OS,,}_${Arch}.tar.gz"

curl -LO "https://github.com/ktr0731/evans/releases/download/${VERSION}/${PKG_TGZ_FILE}"
tar xzvf "${PKG_TGZ_FILE}"

mv evans "${INSTALL_PATH}"

if [ -s "${EXECUTE_PATH}/evans" ]; then
    unlink "${EXECUTE_PATH}/evans"
fi

ln -sfv "${INSTALL_PATH}/evans" "${EXECUTE_PATH}/evans"
cd "${SCRIPT_DIR}"
rm -rf tmp

echo "evans version: ${VERSION} has been installed."
