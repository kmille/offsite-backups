#!/bin/sh -eu
REPOSITORY=desktop:/home/kmille/mounts/interne/borg-backup/linbox
DATE=`date +%Y-%m-%d_%H:%M`

sudo borg create -v -C lz4                      \
    $REPOSITORY::linbox_$DATE                   \
    /                                			\
    --progress                                  \
    --verbose                                   \
    --exclude /dev/								\
	--exclude /proc/						    \
	--exclude /sys/								\
	--exclude /run/								\
	--exclude /mnt/								\
	--exclude /media/							\
	--exclude /lost+found						\
	--exclude /home/kmille/mnt/					\
	--exclude /home/kmille/data/				\
	--exclude /home/kmille/mnt2/				\
    --stats

#DRY_RUN=""
DRY_RUN="--dry-run" 

borg prune $REPOSITORY $DRY_RUN -v --list --keep-last 5
