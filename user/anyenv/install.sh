#!/usr/bin/env bash

# get script path
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# Clone anyenv
if [ ! -d ${HOME}/.anyenv ]; then
    git clone https://github.com/anyenv/anyenv ${HOME}/.anyenv
else
    echo "ERROR: anyenv already exists."
    exit 1
fi

# initialize for setup
export PATH="$HOME/.anyenv/bin:$PATH"
if [ ! -d ${HOME}/.config/anyenv ]; then
    mkdir -p ${HOME}/.config/anyenv
fi
if [ -d ${HOME}/.config/anyenv/anyenv-init ]; then
    rm -rf ${HOME}/.config/anyenv/anyenv-init
fi
git clone https://github.com/anyenv/anyenv-install.git ${HOME}/.config/anyenv/anyenv-install
anyenv install --init
eval "$(anyenv init -)"

# install anyenv plugins
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git

# install pyenv
anyenv install pyenv
# PYENV=${HOME}/.anyenv/envs/pyenv/bin/pyenv
# eval "$($PYENV init -)"
# 
# echo $($PYENV root)

# install pyenv plugins
PYENV_ROOT=${HOME}/.anyenv/envs/pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ${PYENV_ROOT}/plugins/pyenv-virtualenv

# install miniconda3-latest
# ToDo: Arguments Control
# ${PYENV} install miniconda3-latest
# nvim environment ToDo: Arguments Control
# curl -LO https://gist.githubusercontent.com/junkor-1011/b7a8e5dc1f6d633fa589635c04ae3785/raw/2e0452c4c70b8b4180fd381c990f034aa821728c/create_env_nvim.yml
# ${PYENV} shell miniconda3-latest
# conda env create -f create_env_nvim.yml
# rm create_env_nvim.yml



# install nodenv
anyenv install nodenv
# nodenv init

# install node
# ToDo: Arguments Control