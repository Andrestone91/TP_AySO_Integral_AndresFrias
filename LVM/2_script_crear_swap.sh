#!bin/bash

DISCO=$(sudo fdisk -l | grep "3 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

sudo fdisk $DISCO << EOF
n
p



t
82
w
EOF


echo "swap creada"

sudo fdisk -l $DISCO

