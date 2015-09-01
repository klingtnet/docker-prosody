#!/bin/sh

# use this script to backup the contents of your prosody-data container

if [ "$#" -ne 1 ]; then
    echo "USAGE: ./backup.sh /backuppath"
    exit 1
fi

if [ -d "$1" ]; then
    docker run --volumes-from prosody-data -v $1:/backup klingtdotnet/prosody \
    tar cvzf /backup/prosody_backup-$(date --iso-8601).tar.gz \
    /etc/prosody \
    /var/log/prosody \
    /var/lib/prosody
else
    echo "\"$1\" is not a folder or does not exist"
fi
