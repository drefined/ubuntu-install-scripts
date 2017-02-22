#!/bin/bash

wget https://raw.githubusercontent.com/drefined/ubuntu-install-scripts/master/install-golang-64bit.sh
chmod +x install-golang-64bit.sh
./install-golang-64bit.sh

source ~/.bashrc

wget https://raw.githubusercontent.com/drefined/ubuntu-install-scripts/master/install-usocksd.sh
chmod +x install-usocksd.sh
./install-usocksd.sh

wget https://raw.githubusercontent.com/drefined/ubuntu-install-scripts/master/secure-sshd.sh
chmod +x secure-sshd.sh
./secure-sshd.sh $1
