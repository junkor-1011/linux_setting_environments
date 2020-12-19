#!/usr/bin/env bash
# requirement: ubuntu>=20.04

# ToDo: management extra packages by arguments

# get script path
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# cleaning
apt-get clean
rm -rf /var/lib/apt/lists/*
