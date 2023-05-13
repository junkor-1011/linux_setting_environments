#!/bin/sh
set -eux

echo "WARNING: this script is under construction."
exit

if !(type fc-cache > /dev/null 2>&1); then
    echo "not installed fc-cache, stop execution."
    exit 1
fi


SCRIPT_DIR=$(cd $(dirname $0); pwd)

for dir in $(ls -d */); do
    echo "install font: ${dir}"
    ${dir}install.sh NO_CACHE
done

# recache
rm -rf $HOME/.cache/fontconfig/*
fc-cache -fv

echo "INFO: finished all intallation of fonts."
