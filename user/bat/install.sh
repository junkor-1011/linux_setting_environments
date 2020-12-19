#!/usr/bin/env sh
set -eu

# get script path
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# ToDo: Arguments
VERSION=v0.17.1
OS=linux
CPU_TYPE=x86_64
BUILD_TYPE=musl
# or gnu
INSTALL_PATH=${HOME}/LocalApps
EXECTIVE_PATH=${HOME}/bin

BAT_PACKAGE="bat-${VERSION}-${CPU_TYPE}-unknown-${OS}-${BUILD_TYPE}"
DOWNLOAD_URL=https://github.com/sharkdp/bat/releases/download/${VERSION}/${BAT_PACKAGE}.tar.gz

# download
curl -LO ${DOWNLOAD_URL}

# install
tar zxvf ${BAT_PACKAGE}.tar.gz     # inflate
if [ ! -d ${INSTALL_PATH} ]; then
    mkdir -p ${INSTALL_PATH}
fi
mv ${BAT_PACKAGE} -t ${INSTALL_PATH}

# remove trash
rm ${BAT_PACKAGE}.tar.gz

# make synbolic link
ln -sfv ${INSTALL_PATH}/${BAT_PACKAGE}/bat ${EXECTIVE_PATH}/bat
