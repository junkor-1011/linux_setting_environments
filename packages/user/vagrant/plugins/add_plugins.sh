#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# constant
PLUGIN_LIST_FILE=${SCRIPT_DIR}/vagrant_plugins_list.txt

# install plugins
for plugin in $(cat ${PLUGIN_LIST_FILE}); do
    vagrant plugin install $plugin
done

echo "Finished: add vagrant plugins"
