#!/bin/bash
set -e

echo "Diable PasswordAuthentication"
sed -re 's/^(PasswordAuthentication)([[:space:]]+)yes/\1\2no/' -i.`date -I` /etc/ssh/sshd_config

echo "Enable AuthorizedKeysFile"
sed -re 's/^(\#)(AuthorizedKeysFile)([[:space:]]+)(.*)/\2\3\4/' -i.`date -I` /etc/ssh/sshd_config

cat >> $HOME/.ssh/authorized_keys << EOF
$1

EOF

ufw allow ssh
echo 'y' | ufw enable
ufw reload
