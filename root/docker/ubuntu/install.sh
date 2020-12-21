#!/usr/bin/env sh
# execute by root
set -eu

# ref(docker): https://docs.docker.com/engine/install/ubuntu/
# ref(compose): https://docs.docker.com/compose/install/

# remove old versions
# sudo apt-get remove docker docker-engine docker.io containerd runc

# compose version
VERSION_COMPOSE=1.27.4

# setup the repository
apt-get update

apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

# x86_64
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io


# docker-compose
curl -L "https://github.com/docker/compose/releases/download/${VERSION_COMPOSE}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# or setting visudo to execute /usr/local/bin
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# service start
service docker start 
