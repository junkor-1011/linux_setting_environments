#!/bin/sh
# execute by root

# refs: https://github.com/cli/cli/blob/trunk/docs/install_linux.md

apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
apt-add-repository -y https://cli.github.com/packages
apt-get -y update
apt-get -y install gh

echo "Finished: install gh"
