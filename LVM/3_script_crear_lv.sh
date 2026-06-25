#!bin/bash

PARTICION1=$(sudo fdisk -l | grep "LVM" | awk '{print $1}' | head -n1)
PARTICION2=$(sudo fdisk -l | grep "LVM" | awk '{print $1}' | tail -n1)
SWAP=$(sudo fdisk -l | grep "swap" | awk '{print $1}')

#crear pv
sudo pvcreate $PARTICION1
sudo pvcreate $PARTICION2
sudo pvcreate $SWAP
sudo pvs

#crear vg
sudo vgcreate vg_datos $PARTICION1 $PARTICION2
sudo vgcreate vg_temp $SWAP
sudo vgs

#crear lv
sudo lvcreate -L +10M vg_datos -n lv_docker
sudo lvcreate -L +2500M vg_datos -n lv_workareas
sudo lvcreate -L +2500M vg_temp -n lv_swap
sudo lvs


