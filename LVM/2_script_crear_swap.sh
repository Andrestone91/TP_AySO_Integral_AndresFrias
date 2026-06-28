#!bin/bash

DISCO=$(sudo fdisk -l | grep "3 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

# Verificar si ya existe la partición
if lsblk -n "$DISCO" | grep -q "^$(basename "$DISCO")1"; then
    echo "La partición ${DISCO}1 ya existe. Saltando..."
else
    sudo fdisk "$DISCO" << EOF
n
p



t
82
w
EOF


	echo "swap creada"

sudo fdisk -l "$DISCO"

