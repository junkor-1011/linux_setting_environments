#!/usr/bin/env sh
# execute by root
set -eu

apt-get -y install ubuntu-desktop

# tweak-tools
apt-add-repository universe
apt-get -y update
apt-get -y install gnome-tweak-tool

# remote-desktop
apt-get -y install \
    xrdp \
    remmina

# japanese
apt install -y \
    language-pack-ja-base language-pack-ja \
    ibus-kkc ibus-mozc

# ubuntu-defaults-ja
UBUNTU_VERSION=$(. /etc/lsb-release; echo $DISTRIB_RELEASE)
UBUNTU_CODENAME=$(. /etc/lsb-release; echo $DISTIB_CODENAME)
if [ $UBUNTU_VERSION = "20.10" ]; then
    echo $UBUNTU_CODENAME
    wget https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -P /etc/apt/trusted.gpg.d/
    wget https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -P /etc/apt/trusted.gpg.d/
    wget https://www.ubuntulinux.jp/sources.list.d/groovy.list -O /etc/apt/sources.list.d/ubuntu-ja.list
else if [ $UBUNTU_VERSION = "20.04" ]; then
    echo $UBUNTU_CODENAME
    wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | apt-key add -
    wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | apt-key add -
    wget https://www.ubuntulinux.jp/sources.list.d/focal.list -O /etc/apt/sources.list.d/ubuntu-ja.list
else if [ $UBUNTU_VERSION = "18.04" ]; then
    echo $UBUNTU_CODENAME
    wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | apt-key add -
    wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | apt-key add -
    wget https://www.ubuntulinux.jp/sources.list.d/bionic.list -O /etc/apt/sources.list.d/ubuntu-ja.list
fi
apt-get -y update
apt-get -y upgrade
apt-get -y install ubuntu-defaults-ja
