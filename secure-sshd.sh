#!/bin/bash
set -e

USER=$1
GROUP=$2
SSH_PUB_KEY=$3
USER_HOME=/home/$USER

echo "Diable PasswordAuthentication"
sed -re 's/^(PasswordAuthentication)([[:space:]]+)yes/\1\2no/' -i.`date -I` /etc/ssh/sshd_config

echo "Enable AuthorizedKeysFile"
sed -re 's/^(\#)(AuthorizedKeysFile)([[:space:]]+)(.*)/\2\3\4/' -i.`date -I` /etc/ssh/sshd_config

mkdir -p $USER_HOME/.ssh
touch $USER_HOME/.ssh/authorized_keys
chown $USER:$GROUP $USER_HOME/.ssh/authorized_keys

cat >> $USER_HOME/.ssh/authorized_keys << EOF
$SSH_PUB_KEY

EOF

ufw allow ssh
echo 'y' | ufw enable
ufw reload
