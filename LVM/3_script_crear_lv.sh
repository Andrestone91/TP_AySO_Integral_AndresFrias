#!bin/bash

PARTICION1=$(sudo fdisk -l | grep "LVM" | awk '{print $1}' | head -n1)
PARTICION2=$(sudo fdisk -l | grep "LVM" | awk '{print $1}' | tail -n1)
SWAP=$(sudo fdisk -l | grep "swap" | awk '{print $1}')

# Crear PV
for PV in "$PARTICION1" "$PARTICION2" "$SWAP"; do
    if ! sudo pvs "$PV" &>/dev/null; then
        sudo pvcreate "$PV"
    else
        echo "PV $PV ya existe. Saltando..."
    fi
done

sudo pvs

# Crear VG
if ! sudo vgs vg_datos &>/dev/null; then
    sudo vgcreate vg_datos "$PARTICION1" "$PARTICION2"
else
    echo "VG vg_datos ya existe. Saltando..."
fi

if ! sudo vgs vg_temp &>/dev/null; then
    sudo vgcreate vg_temp "$SWAP"
else
    echo "VG vg_temp ya existe. Saltando..."
fi

sudo vgs

# Crear LV
if ! sudo lvs vg_datos/lv_docker &>/dev/null; then
    sudo lvcreate -L 10M -n lv_docker vg_datos
else
    echo "LV lv_docker ya existe."
fi

if ! sudo lvs vg_datos/lv_workareas &>/dev/null; then
    sudo lvcreate -L 2500M -n lv_workareas vg_datos
else
    echo "LV lv_workareas ya existe."
fi

if ! sudo lvs vg_temp/lv_swap &>/dev/null; then
    sudo lvcreate -L 2500M -n lv_swap vg_temp
else
    echo "LV lv_swap ya existe."
fi

sudo lvs


