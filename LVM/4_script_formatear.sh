#!bin/bash

DOCKER=$(sudo fdisk -l | grep "docker" | awk '{print $2}' | awk -F ':' '{print $1}')
WORKAREAS=$(sudo fdisk -l | grep "workareas" | awk '{print $2}' | awk -F ':' '{print $1}')
SWAP=$(sudo fdisk -l | grep "lv_swap" | awk '{print $2}' | awk -F ':' '{print $1}')

# Formatear DOCKER solo si no tiene sistema de archivos
if ! sudo blkid "$DOCKER" | grep -q 'TYPE='; then
    sudo mkfs.ext4 "$DOCKER"
else
    echo "$DOCKER ya está formateado."
fi

# Formatear WORKAREAS solo si no tiene sistema de archivos
if ! sudo blkid "$WORKAREAS" | grep -q 'TYPE='; then
    sudo mkfs.ext4 "$WORKAREAS"
else
    echo "$WORKAREAS ya está formateado."
fi

# Crear swap solo si aún no es swap
if ! sudo blkid "$SWAP" | grep -q 'TYPE="swap"'; then
    sudo mkswap "$SWAP"
else
    echo "$SWAP ya está inicializado como swap."
fi

# Activar swap solo si no está activa
if ! swapon --show | grep -q "$SWAP"; then
    sudo swapon "$SWAP"
else
    echo "$SWAP ya está activa."
fi

free -h

echo 'formato completado'

