#!bin/bash

DOCKER=$(sudo fdisk -l | grep "docker" | awk '{print $2}' | awk -F ':' '{print $1}')
WORKAREAS=$(sudo fdisk -l | grep "workareas" | awk '{print $2}' | awk -F ':' '{print $1}')
SWAP=$(sudo fdisk -l | grep "lv_swap" | awk '{print $2}' | awk -F ':' '{print $1}')

sudo mkfs.ext4 $DOCKER
sudo mkfs.ext4 $WORKAREAS

sudo mkswap $SWAP
sudo swapon $SWAP
free -h

echo 'formato completado'

