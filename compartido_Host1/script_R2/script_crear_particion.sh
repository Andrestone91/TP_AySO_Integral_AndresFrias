#!bin/bash

DISCO1=$(sudo fdisk -l | grep "5 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')
DISCO2=$(sudo fdisk -l | grep "2 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

sudo fdisk $DISCO1 << EOF
n
p


+3G
t
8e
w
EOF

sudo fdisk $DISCO2 << EOF
n
p



t
8e
w
EOF

echo "particiones tipo lvm creadas"

sudo fdisk -l $DISCO1
sudo fdisk -l $DISCO2
