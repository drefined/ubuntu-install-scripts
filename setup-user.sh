#!/bin/bash

USER=$1
GROUP=$2
PASS=$3

groupadd $GROUP
useradd -m -s /bin/bash -g $GROUP $USER
echo $USER:$PASS | chpasswd
