#!/usr/bin/env bash
set -eu

# expect -c "
#     spawn /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#     expect \"[sudo] password for ${USER}: \"
#     send \x04
# "

INSTALL_SCRIPT=_tmp.sh

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o ${INSTALL_SCRIPT}
expect -c "
    spawn /bin/bash _tmp.sh
    expect \"password for ${USER}: \"
    send \x04
    set timeout 6000
    expect \"Press RETURN to continue or any other key to abort\"
    send \x0a
    expect \"no password was provided\"
    send \x0a
"
wait
# sleep 2

rm ${INSTALL_SCRIPT}

echo "Finished"
