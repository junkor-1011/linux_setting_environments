#!/usr/bin/env sh
set -eu

# requirements: unzip

# get script path
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# ToDo: Arguments
# ToDo: control version by arguments
CPU_TYPE=x86_64
# or aarch64
INSTALL_BASE=${HOME}/LocalApps
INSTALL_PATH=${INSTALL_BASE}/aws-cli
EXECTIVE_PATH=${HOME}/bin

# download
curl "https://awscli.amazonaws.com/awscli-exe-linux-${CPU_TYPE}.zip" -o "awscliv2.zip"

# inflate zip to 'aws/'
unzip awscliv2.zip

# install
if [ ! -d ${INSTALL_PATH}} ]; then
    mkdir -p ${INSTALL_PATH}
fi
./aws/install -i ${INSTALL_PATH} -b ${EXECTIVE_PATH}

# rm trash
rm awscliv2.zip
rm -rf aws/

# finish
echo "Done: install aws-cli2"
