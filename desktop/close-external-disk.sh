#!/bin/bash
set -eu

if mountpoint -q /home/kmille/mounts/externe
then
    sudo umount /home/kmille/mounts/externe
else
    echo "Platte ist schon unmountet"
fi

if sudo pvdisplay /dev/mapper/externe >/dev/null 2>&1
then
    sudo vgchange -a n vg2 >/dev/null
fi

if sudo dmsetup -v table /dev/mapper/externe >/dev/null 2>&1 
then
    sudo cryptsetup luksClose externe
fi

