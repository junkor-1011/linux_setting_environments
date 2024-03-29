#!/usr/bin/env bash
# requirement: ubuntu>=20.04
set -eu

# ToDo: management extra packages by arguments

# get script path
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# install core packages
apt-get -y update
# apt -y upgrade
apt-get install -y --no-install-recommends \
    build-essential \
    zip unzip bzip2 xz-utils \
    p7zip-full unrar \
    nkf dos2unix \
    tree \
    jq \
    vim emacs \
    net-tools \
    whois \
    autossh openssl libssl-dev \
    curl wget file \
    git tig subversion \
    git-flow \
    ca-certificates \
    fontconfig \
    fonts-ipafont \
    locales \
    expect \
    tmux bash zsh fish \
    shellcheck \
    sudo \
    ruby \
    python3 python3-dev python3-pip python3-venv \
    silversearcher-ag ack \
    peco \
    exa hexyl fd-find \
    global exuberant-ctags \
    xclip xsel x11-apps mesa-utils-extra \
    wl-clipboard \
    pandoc \
    libfuse2
apt-get -y upgrade
apt-get -y autoremove

# ripgrep
sh additional/install_ripgrep_deb.sh

# bat
sh additional/install_bat_deb.sh


# cleaning
# apt-get clean
# rm -rf /var/lib/apt/lists/*
