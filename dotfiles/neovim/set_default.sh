#!/bin/sh
set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}

if [ ! -f .config/nvim/local_setting.vim ]; then
    cp .config/nvim/local_setting.vim.template .config/nvim/local_setting.vim
else
    echo "PASS(already exist local_setting.vim)"
fi

echo "Finished: cp local_setting.vim.template to local_setting.vim"
