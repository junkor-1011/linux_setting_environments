#!/usr/bin/env sh
# for amazonlinux-2
# root user execution

# epel
amazon-linux-extras install epel -y
yum-config-manager --enable epel

# Deveopment tool
yum groupinstall "Development Tools"

# yum install (general)
yum install -y \
    curl file git \
    expect \
    bash zsh fish \
    ruby \
    python3 python3-devel \
    the_silver_searcher ack \
    unzip unrar p7zip \
    xclip

# ripgrep
yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
yum install -y ripgrep


# CLEAN
yum clean all
