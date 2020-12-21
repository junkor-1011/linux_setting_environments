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
EXECUTIVE_PATH=${HOME}/bin

NVIM_PACKAGE=nvim-${OS}
DOWNLOAD_URL=https://github.com/neovim/neovim/releases/download/${VERSION}/${NVIM_PACKAGE}.tar.gz

# download
curl -LO ${DOWNLOAD_URL}

# install
tar zxvf ${NVIM_PACKAGE}.tar.gz     # inflate
if [ ! -d ${INSTALL_PATH} ]; then
    mkdir -p ${INSTALL_PATH}
fi
if [ -d ${INSTALL_PATH}/${NVIM_PACKAGE} ]; then
    # rm old files
    rm -rf ${INSTALL_PATH}/${NVIM_PACKAGE}
fi
mv ${NVIM_PACKAGE} -t ${INSTALL_PATH}

# remove trash
rm ${NVIM_PACKAGE}.tar.gz

# make synbolic link
if [ ! -d ${EXECUTIVE_PATH} ]; then
    mkdir -p ${EXECUTIVE_PATH}
fi
ln -snfv ${INSTALL_PATH}/${NVIM_PACKAGE}/bin/nvim ${EXECUTIVE_PATH}/nvim
