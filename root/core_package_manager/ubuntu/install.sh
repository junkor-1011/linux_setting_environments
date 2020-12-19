#!/usr/bin/env bash
# requirement: ubuntu>=20.04

# ToDo: management extra packages by arguments

# get script path
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# install core packages
apt -y update
apt install -y --no-install-recommends \
    build-essential \
    zip unzip bzip2 \
    p7zip-full unrar \
    openssl libssl-dev \
    curl wget file \
    git \
    ca-certificates \
    fontconfig \
    locales \
    expect \
    tmux bash zsh fish \
    sudo \
    python3 python3-dev \
    silversearcher-ag ack \
    peco

# ripgrep
sh additional/install_ripgrep_deb.sh

# bat
sh additional/install_bat_deb.sh


# cleaning
# apt-get clean
# rm -rf /var/lib/apt/lists/*
