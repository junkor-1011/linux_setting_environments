#!/usr/bin/env sh
set -eu

# ToDo: Arguments
VERSION=0.14.0
OS=linux
CPU_TYPE=amd64
INSTALL_PATH=${HOME}/LocalApps/terraform_${VERSION}
EXECTIVE_PATH=${HOME}/bin

# download
ZIP_FILENAME=terraform_${VERSION}_${OS}_${CPU_TYPE}.zip
DOWNLOAD_URL=https://releases.hashicorp.com/terraform/${VERSION}/${ZIP_FILENAME}
curl -O ${DOWNLOAD_URL}

# install
unzip ${ZIP_FILENAME}   # inflate terrafom
if [ ! -d ${INSTALL_PATH} ]; then
    mkdir -p ${INSTALL_PATH}
fi
mv terraform ${INSTALL_PATH}/

# rm trash
rm ${ZIP_FILENAME}

# make synbolic link
ln -fs ${INSTALL_PATH}/terraform ${EXECTIVE_PATH}/terraform
