#!/bin/bash
sudo echo ''
echo 'PREPARE [Installing Ansible.] *********************************'
echo ''
sudo apt-get update -y >/dev/null 2>&1
sudo apt-get install git curl python3 python3-pip -y >/dev/null 2>&1
pip3 install ansible > /dev/null 2>&1
git clone https://github.com/justin-p/ansible-my-linux-workstation /tmp/ansible_my_linux_workstation >/dev/null 2>&1
export PATH=$PATH:/$HOME/.local/bin

echo 'PREPARE [Installing requirements with Ansible-Galaxy.] ********'
echo ''
ansible-galaxy install -r /tmp/ansible_my_linux_workstation/requirements.yml >/dev/null 2>&1
echo 'RUN [Running playbook.] ***************************************'
ansible-playbook /tmp/ansible_my_linux_workstation/main.yml -i /tmp/ansible_my_linux_workstation/inventory.yml

echo -e '\e[35m[WARNING]: Please reboot the system to apply all changes.'
echo ''
