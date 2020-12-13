#!/usr/bin/env sh

# ref(docker): https://docs.docker.com/engine/install/ubuntu/
# ref(compose): https://docs.docker.com/compose/install/

# remove old versions
# sudo apt-get remove docker docker-engine docker.io containerd runc

# compose version
VERSION_COMPOSE=1.27.4

# setup the repository
sudo apt-get update

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key -y fingerprint 0EBFCD88

# x86_64
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io


# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/${VERSION_COMPOSE}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# or setting visudo to execute /usr/local/bin
sudo ln -s /usr/bin/docker-compose /usr/local/bin/docker-compose
