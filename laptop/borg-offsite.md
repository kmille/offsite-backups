# How to make a backup: Laptop => rsync.net
## 1) Let's make a backup
```bash
kmille@linbox laptop master % ./borg-offsite.sh
[sudo] password for kmille:
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
Creating archive at "prio.ch-s012.rsync.net:borg-backup::linbox_2020-02-27_15:59"
Synchronizing chunks cache...
Archives: 3, w/ cached Idx: 0, w/ outdated Idx: 0, w/o cached Idx: 3.
Fetching and building archive index for desktop_data_2020-02-27_12:16 ...16
Merging into master chunks index ...
Fetching and building archive index for desktop_data_2020-02-27_14:24 ...24
Merging into master chunks index ...
Fetching and building archive index for linbox_2020-02-27_09:02 ...02
Merging into master chunks index ...
Done.
Remote: Borg 0.29.0: exception in RPC call:
Remote: Traceback (most recent call last):
Remote:   File "/usr/home/kibab/borgbackup-0.29.0/borg/remote.py", line 91, in serve
Remote: borg.remote.InvalidRPCMethod: get_free_nonce
Remote: Platform: FreeBSD ch-s012.rsync.net 11.1-RELEASE-p6 FreeBSD 11.1-RELEASE-p6 #0: Tue Dec 19 13:52:29 PST 2017     user@11_1:/usr/src/sys/amd64/compile/kernel.11_1amd64 amd64
Remote: Python: CPython 3.4.3
Remote:
Please upgrade to borg version 1.1+ on the server for safer AES-CTR nonce handling.
------------------------------------------------------------------------------
Archive name: linbox_2020-02-27_15:59
Archive fingerprint: da7f80593f91a2eb11fc20a089ff1a5525a14a35424fadae0bce5480f8ad51a0
Time (start): Thu, 2020-02-27 16:00:08
Time (end):   Thu, 2020-02-27 16:05:00
Duration: 4 minutes 52.21 seconds
Number of files: 1234802
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:              152.46 GB            102.76 GB            440.31 MB
All archives:              336.30 GB            235.41 GB            110.35 GB

                       Unique chunks         Total chunks
Chunk index:                  965886              2568788
------------------------------------------------------------------------------
kmille@linbox laptop master %


Host rsync.net ch-s012.rsync.net
    Hostname ch-s012.rsync.net
    User <redacted>
    ForwardAgent no
    IdentityFile /home/kmille/.ssh/desktop

Host prio.ch-s012.rsync.net
    Hostname prio.ch-s012.rsync.net
    User <redacted>
    ForwardAgent no
    IdentityFile /home/kmille/.ssh/desktop
```

## 2) Restore
```bash
kmille@linbox laptop master % borg list prio.ch-s012.rsync.net:borg-backup
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
Warning: The repository at location ssh://prio.ch-s012.rsync.net/./borg-backup was previously located at ssh://rsync.net/./borg-backup
Do you want to continue? [yN] y
linbox_2020-02-27_09:02              Thu, 2020-02-27 09:02:29 [ceb32e385894e4d2289ec84bca7b554177131bc6d4e2e4662b285704dcf38b24]
desktop_data_2020-02-27_12:16        Thu, 2020-02-27 12:17:43 [c8a626300a3a3d8dc74ff572ebeece851875b58e5b6d9bfd981a7e8314b1d6d4]
desktop_data_2020-02-27_14:24        Thu, 2020-02-27 14:25:31 [443121fa1f475d006b4317a6a2735132955aa73b2a56c9171078d1e1effcede5]
linbox_2020-02-27_15:59              Thu, 2020-02-27 16:00:08 [da7f80593f91a2eb11fc20a089ff1a5525a14a35424fadae0bce5480f8ad51a0]

kmille@linbox laptop master % borg mount prio.ch-s012.rsync.net:borg-backup::linbox_2020-02-27_15:59 /home/kmille/mnt
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
kmille@linbox laptop master % ls /home/kmille/mnt/
total 6.0K
drwxr-xr-x   1 kmille users    0 Feb 27 16:11 .
drwxr-xr-x   1 kmille users    0 Feb 27 16:11 .
drwx------ 100 kmille users 4.0K Feb 27 16:11 ..
lrwxrwxrwx   1 root   root     7 Nov 13 17:23 bin -> usr/bin
drwxr-xr-x   1 root   root     0 Feb 15 21:57 boot
drwxr-xr-x   1 root   root     0 Feb 27 13:22 dev
drwxr-xr-x   1 root   root     0 Feb 26 15:53 etc
drwxr-xr-x   1 root   root     0 Sep 17  2016 home
lrwxrwxrwx   1 root   root     7 Nov 13 17:23 lib -> usr/lib
lrwxrwxrwx   1 root   root     7 Nov 13 17:23 lib64 -> usr/lib
drwxr-xr-x   1 root   root     0 Sep 30  2015 mnt
drwxr-xr-x   1 root   root     0 Oct 31  2018 mpd
drwxr-xr-x   1 root   root     0 Feb 12 21:06 opt
drwxr-xr-x   1 root   root     0 Jun  2  2019 path
dr-xr-xr-x   1 root   root     0 Feb 15 21:58 proc
drwxr-x---   1 root   root     0 Feb 27 15:53 root
drwxr-xr-x   1 root   root     0 Feb 26 12:26 run
lrwxrwxrwx   1 root   root     7 Nov 13 17:23 sbin -> usr/bin
drwxr-xr-x   1 root   root     0 May  4  2018 srv
dr-xr-xr-x   1 root   root     0 Feb 15 21:58 sys
drwxrwxrwt   1 root   root     0 Feb 27 16:01 tmp
drwxr-xr-x   1 root   root     0 Feb 26 15:53 usr
drwxr-xr-x   1 root   root     0 Feb 15 21:58 var
kmille@linbox laptop master % fusermount -u /home/kmille/mnt
kmille@linbox laptop master %
```

