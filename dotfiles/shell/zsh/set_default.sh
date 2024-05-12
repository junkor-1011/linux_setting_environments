#!/bin/sh
set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}

if [ ! -f .zsh_local/local_rc.sh ]; then
    cp .zsh_local/local_rc.sh.template .zsh_local/local_rc.sh
else
    echo "PASS(already exist local_rc.sh)"
fi

if [ ! -f .zsh_local/local_rc.zsh ]; then
    cp .zsh_local/local_rc.zsh.template .zsh_local/local_rc.zsh
else
    echo "PASS(already exist local_rc.zsh)"
fi

if [ ! -f .zsh_local/p10k.zsh ]; then
    cp .zsh_local/p10k_example.zsh .zsh_local/p10k.zsh
else
    echo "PASS(already exist p10k.zsh)"
fi

echo "Finished: cp local_rc.sh & local_rc.zsh & p10k_example"
