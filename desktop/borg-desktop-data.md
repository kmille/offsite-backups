# How to make a backup: Desktop data => rsync.net

## 1) Let's make a backup

```bash
kmille@homebox desktop master % ./mount-internal-disk.sh
Geben Sie die Passphrase für »/dev/disk/by-uuid/5967c069-0637-40d3-9456-007d9e7ea146« ein:
kmille@homebox desktop master % lsblk
NAME              MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sda                 8:0    0   2,7T  0 disk
└─interne         254:2    0   2,7T  0 crypt
  └─vg1-data      254:3    0     1T  0 lvm   /home/kmille/mounts/interne
sdb                 8:16   0 119,2G  0 disk
├─sdb1              8:17   0     1G  0 part  /boot
└─sdb2              8:18   0 118,2G  0 part
  └─main          254:0    0 118,2G  0 crypt
    └─main-system 254:1    0 118,2G  0 lvm   /
sdc                 8:32   0   2,7T  0 disk
kmille@homebox desktop master %
kmille@homebox desktop master % ./borg-to-rsync.net.sh
Remote: Borg 0.29.0: exception in RPC call:
Remote: Traceback (most recent call last):
Remote:   File "/usr/home/kibab/borgbackup-0.29.0/borg/remote.py", line 96, in serve
Remote: TypeError: open() takes from 2 to 5 positional arguments but 7 were given
Remote: Platform: FreeBSD ch-s012.rsync.net 11.1-RELEASE-p6 FreeBSD 11.1-RELEASE-p6 #0: Tue Dec 19 13:52:29 PST 2017     user@11_1:/usr/src/sys/amd64/compile/kernel.11_1amd64 amd64
Remote: Python: CPython 3.4.3
Remote:
Please note:
If you see a TypeError complaining about the number of positional arguments
given to open(), you can ignore it if it comes from a borg version < 1.0.7.
This TypeError is a cosmetic side effect of the compatibility code borg
clients >= 1.0.7 have to support older borg servers.
This problem will go away as soon as the server has been upgraded to 1.0.7+.
Enter passphrase for key ssh://prio.ch-s012.rsync.net/./borg-backup:
Creating archive at "prio.ch-s012.rsync.net:borg-backup::desktop_data_2020-02-27_16:22"
Synchronizing chunks cache...
Archives: 4, w/ cached Idx: 1, w/ outdated Idx: 0, w/o cached Idx: 3.
Fetching and building archive index for desktop_data_2020-02-27_12:16 ...16
Merging into master chunks index ...
Fetching and building archive index for desktop_data_2020-02-27_14:24 ...24
Merging into master chunks index ...
Reading cached archive chunk index for linbox_2020-02-27_09:02 ...:02
Merging into master chunks index ...
Fetching and building archive index for linbox_2020-02-27_15:59 ...59
Merging into master chunks index ...
Done.
/home/kmille/mounts/interneBilderVideos: [Errno 2] No such file or directory: '/home/kmille/mounts/interneBilderVideos'sicherung/2017/Versicherungsnummer4.pdf
Remote: Borg 0.29.0: exception in RPC call:
Remote: Traceback (most recent call last):
Remote:   File "/usr/home/kibab/borgbackup-0.29.0/borg/remote.py", line 91, in serve
Remote: borg.remote.InvalidRPCMethod: get_free_nonce
Remote: Platform: FreeBSD ch-s012.rsync.net 11.1-RELEASE-p6 FreeBSD 11.1-RELEASE-p6 #0: Tue Dec 19 13:52:29 PST 2017     user@11_1:/usr/src/sys/amd64/compile/kernel.11_1amd64 amd64
Remote: Python: CPython 3.4.3
Remote:
Please upgrade to borg version 1.1+ on the server for safer AES-CTR nonce handling.
------------------------------------------------------------------------------
Archive name: desktop_data_2020-02-27_16:22
Archive fingerprint: 21b8c874545bc813681a514002b578a7ba74af437bb217944107ec272fbd1082
Time (start): Thu, 2020-02-27 16:23:18
Time (end):   Thu, 2020-02-27 16:23:36
Duration: 18.03 seconds
Number of files: 821
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:              387.40 MB            363.87 MB                685 B
All archives:              336.69 GB            235.77 GB            110.35 GB

                       Unique chunks         Total chunks
Chunk index:                  965887              2569701
------------------------------------------------------------------------------
kmille@homebox desktop master %
```
