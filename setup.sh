#!/bin/bash

ask_host() {
    echo "Enter the name or the ip of the host where to deploy"
    read HOST
}

ask_user() {
    echo "Enter the host administrator user"
    read USER
}

ask_passw() {
    echo "Enter the sudo password for the administrator user"
    read -s PASSW
}


check_ssh_con() {
    ssh $USER@$HOST w > /dev/null
    RET=$?
    if [ $RET != 0 ]
        then
            exit $RET
    fi
}

DEV_FILE_TEMP="development_temp.txt"
DEV_FILE="development.txt"

ask_host
ask_user
ask_passw
check_ssh_con
cp $DEV_FILE_TEMP $DEV_FILE
sed -i.BAK 's/<user>/'"$USER"'/g' $DEV_FILE
sed -i.BAK 's/<host>/'"$HOST"'/g' $DEV_FILE
pip install ansible
ansible-playbook playbooks/loadbalancer.yml --extra-vars "ansible_sudo_pass=$PASSW"
ansible-playbook playbooks/webserver.yml --extra-vars "ansible_sudo_pass=$PASSW"
ansible-playbook playbooks/webmin.yml --extra-vars "ansible_sudo_pass=$PASSW"
ansible-playbook playbooks/fail2ban.yml --extra-vars "ansible_sudo_pass=$PASSW"
ansible-playbook playbooks/firewall.yml --extra-vars "ansible_sudo_pass=$PASSW"
rm $DEV_FILE
