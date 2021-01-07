#!/bin/sh
set -eux

# ToDo: improve
USING_SHELL=${1:-zsh}

sed -i -e "s/\/home\/ubuntu:\/bin\/bash/\/home\/ubuntu:\/usr\/bin\/${USING_SHELL}/" /etc/passwd
