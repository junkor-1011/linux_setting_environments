#!/bin/bash
set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# constant
FISHER_PLUGIN_LIST_TXT=fisher-list.txt

# require: fish
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# fisher add
for v in `cat "${SCRIPT_DIR}/${FISHER_PLUGIN_LIST_TXT}"`; do
    fish -c "fisher install ${v}"
done

echo "Done"
