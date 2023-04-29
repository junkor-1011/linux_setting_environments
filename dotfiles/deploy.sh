#!/bin/bash
set -eu

# get this script's path
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# $HOME/.config
if [ ! -d $HOME/.config ]; then
    mkdir -p $HOME/.config
fi

# source common settings
source ${SCRIPT_DIR}/dotfiles

# deploy
for target in ${TARGET_LIST[@]}; do
    echo $target
    /bin/bash ${DEPLOY_SCRIPTS_PATH[$target]} ${DEPLOY_SCRIPTS_OPTS[$target]}

    if [ "${DEPLOY_SCRIPTS_SET_DEFAULT[$target]}" != "" ]; then
        /bin/bash ${DEPLOY_SCRIPTS_SET_DEFAULT[$target]}
    else
        echo "${target} does not have default config template."
    fi
done

echo "Finished: setting all dotfiles."
