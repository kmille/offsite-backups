#!/bin/sh -eu
#REPOSITORY=ch-s012.rsync.net:borg-backup
REPOSITORY=prio.ch-s012.rsync.net:borg-backup
DATE=`date +%Y-%m-%d_%H:%M`

borg create -v -C lz4                            \
    $REPOSITORY::desktop_data_$DATE              \
    /home/kmille/mounts/interne/Bürokratie       \
    /home/kmille/mounts/interne/BilderVideos     \
    --progress                                   \
    --verbose                                    \
    --stats

#DRY_RUN=""
DRY_RUN="--dry-run" 

#borg prune $REPOSITORY $DRY_RUN -v --list --keep-last 5
