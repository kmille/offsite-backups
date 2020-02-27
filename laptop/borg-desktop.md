# How to make a backup: Laptop => Desktop

## 1) Unlock boot disk of Desktop with ssh

```bash
kmille@linbox scripts% ssh desktop-boot
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ED25519 key sent by the remote host is
SHA256:feWocfm4ZAgkYVsyIDvuQrOfxbxjUBCqmZZjsgfzLZw.
Please contact your system administrator.
Add correct host key in /home/kmille/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/kmille/.ssh/known_hosts:231
Password authentication is disabled to avoid man-in-the-middle attacks.
Keyboard-interactive authentication is disabled to avoid man-in-the-middle attacks.
Enter passphrase for /dev/sdb2: 
Connection to 192.168.10.80 closed.
kmille@linbox scripts% 


Host desktop-boot
    HostName 192.168.10.80
    User root
    StrictHostKeyChecking no
    IdentityFile ~/.ssh/desktop
```


## 2) Unlock boot disk of Desktop with ssh
```bash
kmille@linbox scripts% ssh desktop     
Last login: Thu Feb 27 14:53:26 2020 from 192.168.10.70
kmille@homebox scripts master % cd desktop                                      
kmille@homebox desktop master % ./mount-internal-disk.sh    
[sudo] Passwort für kmille: 
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


Host desktop
    HostName 192.168.10.80
    User kmille
    IdentityFile ~/.ssh/desktop
```


## 3) Let's do the backup
```bash
kmille@linbox laptop master % sudo ./borg-desktop.sh
Warning: The repository at location ssh://desktop/home/kmille/mounts/interne/borg-backup/linbox was previously located at ssh://homebox/home/kmille/data/borg-backup/linbox
Do you want to continue? [yN] y
Creating archive at "desktop:/home/kmille/mounts/interne/borg-backup/linbox::linbox_2020-02-27_15:41"
------------------------------------------------------------------------------                            
Archive name: linbox_2020-02-27_15:41                                                                     
Archive fingerprint: 3c9c73e7eefc1e5b6a66162b2363fba31d869a584d13d1078021d34d39e6ce56
Time (start): Thu, 2020-02-27 15:41:20
Time (end):   Thu, 2020-02-27 15:44:36
Duration: 3 minutes 16.30 seconds
Number of files: 1234731
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:              152.46 GB            102.76 GB            170.36 MB
All archives:                1.20 TB            814.37 GB            178.15 GB

                       Unique chunks         Total chunks
Chunk index:                 1780274              9794520
------------------------------------------------------------------------------
kmille@linbox laptop master % 
```

## 2) Restore backup
```bash
kmille@linbox laptop master % borg list desktop:/home/kmille/mounts/interne/borg-backup/linbox
Warning: Attempting to access a previously unknown unencrypted repository!
Do you want to continue? [yN] y
2019-07-07_20:14                     Sun, 2019-07-07 20:14:35 [b8314a7f60a226ed319168818df95d96180f2eabd68c1246ba9e4d9b51ad2813]
2019-10-17_14:15                     Thu, 2019-10-17 14:15:18 [0eb1fdad6f4adcbfd2d6b6c577bd011ceca18ca4eb52b82ee7a1dbddef9140f3]
2019-11-07_15:40                     Thu, 2019-11-07 15:41:03 [96d405506e88ff95978f3c3534a1af8370613ab3782f2e7ea28e58950f080347]
2020-01-03_10:16                     Fri, 2020-01-03 10:16:19 [7f1ec97231526fe56f9068d871d571802f65e9dda25805746f62970a459bc434]
2020-02-23_12:19                     Sun, 2020-02-23 12:19:34 [d1244dd567247fc7d7b824f1b69bda7d1be044d6ba3a858ddbe7a69384f75bb8]
linbox_2020-02-27_12:06              Thu, 2020-02-27 12:07:00 [1bf62171fc18b0742a74da66076e0f208c9a33a1794040b680235fa1fd35872f]
linbox_2020-02-27_15:41              Thu, 2020-02-27 15:41:20 [3c9c73e7eefc1e5b6a66162b2363fba31d869a584d13d1078021d34d39e6ce56]
kmille@linbox laptop master % borg mount desktop:/home/kmille/mounts/interne/borg-backup/linbox::linbox_2020-02-27_12:06 /home/kmille/mnt
kmille@linbox laptop master % fusermount -u /home/kmille/mnt
kmille@linbox laptop master %
```
