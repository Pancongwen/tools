#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

lsblk
if [ $# -ne 1 ];then
	echo ""
	echo -e "${RED}input which disk u want to umount and fix${NC}"
	echo -e "${RED}Usage:	sudo $0 DISK${NC}"
	echo -e "${RED}Example: sudo $0 sdc2${NC}"
	exit 1
fi
sudo umount /dev/$1
lsblk
sudo fsck.ext4 /dev/$1
