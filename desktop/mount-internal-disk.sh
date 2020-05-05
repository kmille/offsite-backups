#!/bin/bash
set -eu

if ! test -b /dev/disk/by-uuid/5967c069-0637-40d3-9456-007d9e7ea146
then
    echo "Externe Platte /dev/disk/by-uuid/5967c069-0637-40d3-9456-007d9e7ea146 nicht gefunden"
fi

if sudo dmsetup -v table /dev/mapper/interne >/dev/null 2>&1
then
    echo "Platte ist schon decrypted"
else
    sudo cryptsetup luksOpen /dev/disk/by-uuid/5967c069-0637-40d3-9456-007d9e7ea146 interne
    sudo vgchange -a y vg1 > /dev/null
    sleep 1
fi

if mountpoint -q /home/kmille/mounts/interne
then
    echo "Platte ist schon gemountet"
else
    sudo mount /dev/vg1/data /home/kmille/mounts/interne
fi

lsblk
