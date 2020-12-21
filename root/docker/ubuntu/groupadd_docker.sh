#!/bin/sh
# execute by root user
set -eu

TARGET=${1:-vagrant}

groupadd docker

gpasswd -a $TARGET docker

# restart
service docker restart
