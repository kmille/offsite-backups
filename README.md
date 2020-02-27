### tldr
Laptop -> Desktop
Desktop: mount interne Disk nach /home/kmille/mounts/interne
Laptop: sudo ./borg-desktop.sh

Laptop -> rsync.net
Laptop: ./borg-offsite.sh

Desktop Daten -> rsync.net
aufm Desktop:  mount interne Disk nach /home/kmille/mounts/interne +  ./borg-to-rsync.net.sh

Desktop => alles auf externe kopieren
externe Platte anstecken + ./backup-to-external-disk.sh


