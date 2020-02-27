#!/bin/bash
set -eu

./mount-external-disk.sh
./mount-internal-disk.sh

echo "rsync von interne auf externe Platte"
rsync -av --delete /home/kmille/mounts/interne/ /home/kmille/mounts/externe
#sudo umount /home/kmille/mounts/interne
#sudo umount /home/kmille/mounts/externe

