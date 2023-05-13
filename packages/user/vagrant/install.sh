#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# ToDo: Arguments
VERSION=2.2.19
OS=linux
CPU_TYPE=amd64
INSTALL_PATH=${HOME}/LocalApps/vagrant_${VERSION}
EXECTIVE_PATH=${HOME}/bin

# download
ZIP_FILENAME=vagrant_${VERSION}_${OS}_${CPU_TYPE}.zip
DOWNLOAD_URL=https://releases.hashicorp.com/vagrant/${VERSION}/${ZIP_FILENAME}
curl -O ${DOWNLOAD_URL}

# install
unzip ${ZIP_FILENAME}   # inflate terrafom
if [ ! -d ${INSTALL_PATH} ]; then
    mkdir -p ${INSTALL_PATH}
fi
mv vagrant ${INSTALL_PATH}/

# rm trash
rm ${ZIP_FILENAME}

# make synbolic link
ln -sfnv ${INSTALL_PATH}/vagrant ${EXECTIVE_PATH}/vagrant
