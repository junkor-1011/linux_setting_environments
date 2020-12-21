#!/bin/sh
set -eu

# require: expect

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# download
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
curl -L https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh -o __install__.sh

# install
expect -c "
  spawn /bin/sh ${SCRIPT_DIR}/__install__.sh
  expect \"▓▒░ Enter y/n and press Return:\"
  send \"n\x0a\"
"

# rm trash
rm __install__.sh

echo "Done"
