#!/bin/bash

USER=$1
GROUP=$2
PASS=$3
SSH_PUB_KEY=$4

wget https://raw.githubusercontent.com/drefined/ubuntu-install-scripts/master/setup-user.sh
chmod +x setup-user.sh
./setup-user.sh $USER $GROUP $PASS

wget https://raw.githubusercontent.com/drefined/ubuntu-install-scripts/master/install-golang-64bit.sh
chmod +x install-golang-64bit.sh
./install-golang-64bit.sh

wget https://raw.githubusercontent.com/drefined/ubuntu-install-scripts/master/install-usocksd.sh
chmod +x install-usocksd.sh
./install-usocksd.sh $USER $GROUP

wget https://raw.githubusercontent.com/drefined/ubuntu-install-scripts/master/secure-sshd.sh
chmod +x secure-sshd.sh
./secure-sshd.sh $SSH_PUB_KEY
