#!/usr/bin/env sh
# execute by root
set -eu

# ref(docker): https://docs.docker.com/engine/install/ubuntu/
# ref(compose): https://docs.docker.com/compose/install/

# uninstall old versions
# yum remove docker \
#     docker-client \
#     docker-client-latest \
#     docker-common \
#     docker-latest \
#     docker-latest-logrotate \
#     docker-logrotate \
#     docker-engine

# install
yum install -y docker

# docker-compose
curl -L "https://github.com/docker/compose/releases/download/${VERSION_COMPOSE}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# or setting visudo to execute /usr/local/bin
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# systemctl
systemctl enable docker
