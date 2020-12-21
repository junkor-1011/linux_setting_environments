#!/usr/bin/env sh
set -eu

# get script path
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# ToDo: Arguments
# VERSION=v0.4.4
VERSION=stable
OS=linux64
INSTALL_PATH=${HOME}/LocalApps
EXECTIVE_PATH=${HOME}/bin

NVIM_PACKAGE=nvim-${OS}
DOWNLOAD_URL=https://github.com/neovim/neovim/releases/download/${VERSION}/${NVIM_PACKAGE}.tar.gz

# download
curl -LO ${DOWNLOAD_URL}

# install
tar zxvf ${NVIM_PACKAGE}.tar.gz     # inflate
if [ ! -d ${INSTALL_PATH} ]; then
    mkdir -p ${INSTALL_PATH}
fi
mv ${NVIM_PACKAGE} -t ${INSTALL_PATH}

# remove trash
rm ${NVIM_PACKAGE}.tar.gz

# make synbolic link
ln -s ${INSTALL_PATH}/${NVIM_PACKAGE}/bin/nvim ${EXECTIVE_PATH}/nvim
