#!bin/bash

DISCO1=$(sudo fdisk -l | grep "5 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')
DISCO2=$(sudo fdisk -l | grep "2 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

crear_particion_lvm() {

	 DISCO=$1
	 TAMANIO=$2
	
	 # Si ya existe la primera partición, no hacer nada
    if lsblk -n "$DISCO" | grep -q "^$(basename "$DISCO")1"; then
        echo "La partición ${DISCO}1 ya existe. Saltando..."
        return
    fi
	
	sudo fdisk $DISCO << EOF
n
p


$TAMANIO
t
8e
w
EOF

	echo "particiones tipo lvm creadas"
}

crear_particion_lvm "$DISCO1" "+3G"
crear_particion_lvm "$DISCO2" ""

echo "Estado final:"

sudo fdisk -l "$DISCO1"
sudo fdisk -l "$DISCO2"
