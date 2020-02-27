#!/bin/bash
set -eu

if ! test -b /dev/disk/by-uuid/e658d91d-cfc7-472a-bd4d-cd5cf8d6f30e
then
    echo "Externe Platte /dev/disk/by-uuid/e658d91d-cfc7-472a-bd4d-cd5cf8d6f30e nicht gefunden"
fi

if sudo dmsetup -v table /dev/mapper/externe >/dev/null 2>&1 
then
    echo "Platte ist schon decrypted"
else
    sudo cryptsetup luksOpen /dev/disk/by-uuid/e658d91d-cfc7-472a-bd4d-cd5cf8d6f30e externe
    sudo vgchange -a y vg2 >/dev/null
    sleep 1
fi

if mountpoint -q /home/kmille/mounts/externe
then
    echo "Platte ist schon gemountet"
else
    sudo mount /dev/vg2/ext_backup /home/kmille/mounts/externe
fi
