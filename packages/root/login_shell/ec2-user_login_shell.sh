#!/bin/sh
set -eux

# ToDo: improve
USING_SHELL=${1:-zsh}

sed -i -e "s/\/home\/ec2-user:\/bin\/bash/\/home\/ec2-user:\/usr\/bin\/${USING_SHELL}/" /etc/passwd
