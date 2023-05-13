#!/bin/sh
set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# tmp dir
mkdir __TMP__

# download
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > __TMP__/installer.sh
# install
/bin/sh __TMP__/installer.sh $HOME/.cache/dein

# remove tmp dir
rm -rf __TMP__

echo "Done"
