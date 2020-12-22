#!/bin/sh
set -eu

# ToDo: improve
USING_SHELL=${1:-zsh}

sed -i -e "s/\/home\/vagrant:\/bin\/bash/\/home\/vagrant:\/usr\/bin\/${USING_SHELL}/" /etc/passwd
