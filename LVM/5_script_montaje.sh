#!bin/bash

sudo mkdir /work

DOCKER=$(sudo fdisk -l | grep "docker" | awk '{print $2}' | awk -F ':' '{print $1}')
WORKAREAS=$(sudo fdisk -l | grep "workareas" | awk '{print $2}' | awk -F ':' '{print $1}')

# Montar lv_docker solo si no está montado
if ! mountpoint -q /var/lib/docker; then
    sudo mount "$DOCKER" /var/lib/docker
else
    echo "/var/lib/docker ya está montado."
fi

# Montar lv_workareas solo si no está montado
if ! mountpoint -q /work; then
    sudo mount "$WORKAREAS" /work
else
    echo "/work ya está montado."
fi

echo 'montaje finalizado correctamente'

