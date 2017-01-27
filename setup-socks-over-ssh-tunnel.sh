#!/bin/bash
set -e

HOST=$1

cat >> $HOME/.ssh/config << EOF
Host socks-proxy-tunnel
    Hostname $HOST
    User root
    Port 22
    IdentityFile ~/.ssh/id_rsa.proxy
    LocalForward 1080 localhost:1080
    ServerAliveInterval 30
    ServerAliveCountMax 3

EOF

apt-get install -y autossh

autossh -M 0 -f -T -N socks-proxy-tunnel
