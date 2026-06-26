#!bin/bash

sudo mkdir /work/

DOCKER=$(sudo fdisk -l | grep "docker" | awk '{print $2}' | awk -F ':' '{print $1}')
WORKAREAS=$(sudo fdisk -l | grep "workareas" | awk '{print $2}' | awk -F ':' '{print $1}')

sudo mount $DOCKER /var/lib/docker/
sudo mount $WORKAREAS /work/

echo 'montaje finalizado correctamente'

