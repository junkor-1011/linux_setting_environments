#!/usr/bin/env sh
# execute by root

apt -y install ubuntu-desktop

# tweak-tools
apt-add-repository universe
apt update
apt install -y gnome-tweak-tool

# japanese
apt install -y \
    language-pack-ja-base language-pack-ja \
    ibus-kkc ibus-mozc
