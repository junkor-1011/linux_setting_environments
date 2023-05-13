#!/usr/bin/env bash
set -eu

SCRIPTDIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPTDIR"

# ToDo: Auguments or Config
VERSION=22.3
OS="$(uname)"
Arch="$(arch)"
PACKAGE_ZIP_FILENAME="protoc-${VERSION}-${OS,,}-${Arch}.zip"

INSTALL_PATH="${HOME}/LocalApps"
EXECUTE_PATH="${HOME}/bin"

if [ ! -d "${INSTALL_PATH}" ]; then
    mkdir -p "${INSTALL_PATH}"
fi
if [ ! -d "${EXECUTE_PATH}" ]; then
    mkdir -p "${EXECUTE_PATH}"
fi

WORKDIR="protobuf-v${VERSION}"

if [ -d "${WORKDIR}" ]; then
    rm -rf "${WORKDIR}"
fi
mkdir "${WORKDIR}"; cd "${WORKDIR}"


echo "Let's Install ProtoBuf ver: v${VERSION}, please check if there is newer version."

# Download binary package
curl -LO "https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION}/${PACKAGE_ZIP_FILENAME}"
unzip "${PACKAGE_ZIP_FILENAME}"
rm "${PACKAGE_ZIP_FILENAME}"
cd "${SCRIPTDIR}"

if [ -d "${INSTALL_PATH}/${WORKDIR}" ]; then
    rm -rf "${INSTALL_PATH}/${WORKDIR}"
fi
mv "${WORKDIR}" -t "${INSTALL_PATH}"

if [ -s "${EXECUTE_PATH}/protoc" ]; then
    unlink "${EXECUTE_PATH}/protoc"
fi

ln -sfv "${INSTALL_PATH}/${WORKDIR}/bin/protoc" "${EXECUTE_PATH}/protoc"

echo "protobuf version: ${VERSION} has been installed."
