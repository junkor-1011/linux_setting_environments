#!/usr/bin/env sh
# for amazonlinux-2
# root user execution
set -eu

# upgrade
# yum update -y     # if need

# epel
amazon-linux-extras install epel -y
yum-config-manager --enable epel

# Deveopment tool
yum groupinstall "Development Tools"

# yum install (general)
yum install -y \
    curl file git \
    expect \
    locales \
    fontconfig \
    tig subversion \
    nkf dos2unix \
    tree \
    jq \
    vim emacs \
    net-tools \
    autossh openssl openssl-devel \
    tmux bash zsh fish \
    ruby \
    python3 python3-devel \
    the_silver_searcher ack \
    unzip unrar p7zip xz-devel bzip2-devel \
    xclip
yum install -y \
    ctags
    # global    # install failed
yum autoremove -y

# ripgrep
yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
yum install -y ripgrep


# CLEAN
yum clean all
