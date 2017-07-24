#!/bin/bash
sudo umount /dev/$1
lsblk
sudo fsck.ext4 /dev/$1
