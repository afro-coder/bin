#!/bin/bash

set +e

DEST=diskstation:/volume1/backup/lima

{
    echo /bin
    echo /core
    echo /dev
    echo /home/anton/Music
    echo /home/anton/Videos
    echo /home/anton/.miro/Movies
    echo /home/anton/.cache
    echo /home/anton/.thumbnails
    echo /initrd.img
    echo /initrd.img.old
    echo /lib
    echo /lib32
    echo /lib64
    echo /lost+found
    echo /media
    echo /misc
    echo /mnt
    echo /proc
    echo /run
    echo /sbin
    echo /selinux
    echo /srv
    echo /swap
    echo /sys
    echo /tmp
    echo /usr
    echo /var/tmp
    echo /var/cache
    echo /var/lib
    echo /vmlinuz
    echo /vmlinuz.old
} | sudo rsync --archive --verbose --compress --progress --human-readable --delete --delete-excluded --delete-after --exclude-from=- -xdev -e ssh / /home "$DEST"
