#!/usr/bin/env bash
# execute this script after reload shell.

# ToDo: Arguments Control
NODEJS_VERSION=12.20.0

# pyenv

# miniconda3-latest
pyenv install miniconda3-latest

# neovim setting
curl -LO https://gist.githubusercontent.com/junkor-1011/b7a8e5dc1f6d633fa589635c04ae3785/raw/2e0452c4c70b8b4180fd381c990f034aa821728c/create_env_nvim.yml
# pyenv shell miniconda3-latest
CONDA=$(pyenv root)/versions/miniconda3-latest/bin/conda
$CONDA env create -f create_env_nvim.yml
rm create_env_nvim.yml


# node setting
nodenv install ${NODEJS_VERSION}
nodenv global ${NODEJS_VERSION}
npm i -g neovim htmlhint
npm i -g eslint eslint_d prettier stylelint eslint-config-prettier eslint-plugin-prettier prettier-eslint-cli
npm i -g typescript typescript-language-server
npm i -g create-react-app