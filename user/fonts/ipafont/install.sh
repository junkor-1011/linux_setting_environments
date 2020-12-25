#!/bin/sh
set -eux

# ToDo: unable to unzip, must modify

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}

if [ ! -d $HOME/.fonts ]; then
    mkdir -p $HOME/.fonts
    chmod 755 $HOME/.fonts
fi

wget https://moji.or.jp/wp-content/ipafont/IPAexfont/IPAexfont00401.zip
# BUG: failed to unzip
unzip IPAexfont00401.zip
mv IPAexfont00401 -t $HOME/.fonts/
rm IPAexfont00401.zip

if "${1}"!="NO_CACHE"; then
    rm -rf $HOME/.cache/fontconfig/*
    fc-cache -fv
fi

echo "finished installation of ipafont"
