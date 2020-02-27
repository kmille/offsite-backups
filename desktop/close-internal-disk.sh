#!/bin/bash
set -eu

if mountpoint -q /home/kmille/mounts/interne
then
    sudo umount /home/kmille/mounts/interne
else
    echo "Platte ist schon unmountet"
fi

if sudo pvdisplay /dev/mapper/interne >/dev/null 2>&1
then
    sudo vgchange -a n vg1 >/dev/null
fi

if sudo dmsetup -v table /dev/mapper/interne >/dev/null 2>&1 
then
    sudo cryptsetup luksClose interne
fi

