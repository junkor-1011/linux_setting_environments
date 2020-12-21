#!/bin/sh
# execute by root user
set -eu

TARGET=${1:-vagrant}

set +e
groupadd docker
set -e

gpasswd -a $TARGET docker

# restart
service docker restart
