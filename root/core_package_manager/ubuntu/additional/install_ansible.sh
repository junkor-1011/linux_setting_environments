#!/bin/sh
# execute by root
# refs: https://docs.ansible.com/ansible/2.9_ja/installation_guide/intro_installation.html#ubuntu-ansible

apt-get -y update
apt-get -y install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get -y install ansible

echo "Finished: install Ansible"
