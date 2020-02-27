# How to backup: Laptop => Desktop

# Unlock boot disk of Desktop with ssh

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


# Unlock boot disk of Desktop with ssh


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


