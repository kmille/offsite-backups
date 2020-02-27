# rsync everything von Desktop's internal disk to the external disk

## 1) Let's make a backup
kmille@homebox desktop master % ./backup-to-external-disk.sh 
[sudo] Passwort fÃ¼r kmille:    
Geben Sie die Passphrase fÃ¼r Â»/dev/disk/by-uuid/e658d91d-cfc7-472a-bd4d-cd5cf8d6f30eÂ« ein: 
Geben Sie die Passphrase fÃ¼r Â»/dev/disk/by-uuid/5967c069-0637-40d3-9456-007d9e7ea146Â« ein: 
rsync von interne auf externe Platte
sending incremental file list  
deleting borg-backup/linbox/integrity.63432
deleting borg-backup/linbox/index.63432
deleting borg-backup/linbox/hints.63432
borg-backup/linbox/            
borg-backup/linbox/hints.63481 
borg-backup/linbox/index.63481 
borg-backup/linbox/integrity.63481
borg-backup/linbox/nonce       
deleting borg-backup/linbox/data/6/63431
deleting borg-backup/linbox/data/6/63429
deleting borg-backup/linbox/data/6/63427
...
borg-backup/linbox/data/6/63479
borg-backup/linbox/data/6/63480
borg-backup/linbox/data/6/63481

sent 393,973,360 bytes  received 4,267 bytes  31,518,210.16 bytes/sec
total size is 200,982,893,756  speedup is 510.14
```
