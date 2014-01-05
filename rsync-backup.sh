#!/bin/bash
# Usage: backup [OPTION...]

# http://www.dwheeler.com/essays/filenames-in-shell.html
IFS="$(printf '\n\t')"

# Arguments
src="/home/mama/"
dest="/media/DATAMM01/mama-lap-backup/"
include="/home/mama/.rsync-backup-folder-list-include.txt"
exclude="/home/mama/.tmp/log/rsync-backup-folder-list-exclude.txt"
log="/home/mama/.tmp/log/rsync-backup.log"
options="-avh"

# Aplication
if [ -d "$src" -a -d "$dest" -a -f "$include" ]
then
    # Gather files and folders to exclude
    ls -AlF "$src" | awk '{print ($9)}' | grep -v -f "$include" - > "$exclude"
    
    # Backup
    rsync $options $@ --exclude-from="$exclude" "$src" "$dest" &> "$log"
else
    echo "Something is wrong!"
fi
