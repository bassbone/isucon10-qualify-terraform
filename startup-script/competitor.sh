#!/bin/sh
FILE=/initialized.txt
if [ -e ${FILE} ]; then
    exit 0
fi
apt-get update
apt-get -y install ansible git language-pack-ja
update-locale LANG=ja_JP.UTF-8
git clone https://github.com/isucon/isucon10-qualify.git
(
    cd isucon10-qualify/provisioning/ansible
    echo "[competitor]\nlocalhost ansible_connection=local" > local
    echo "[defaults]\nremote_tmp = /root/.ansible/tmp" > ansible.cfg
    ansible-playbook -i local competitor.yaml
)
echo "startup finish!"
touch ${FILE}

