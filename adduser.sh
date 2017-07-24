#!/bin/bash
echo "make sure you can use sudo now"

adduser(){
	echo "---- add user $1 ----"
	sudo adduser $1
	id $1
	echo "---- add user $1 to the sudo group ----"
	sudo usermod -aG sudo $1
	cat /etc/group | grep sudo 
	id $1
}

#deleteuser(){
#	echo "---- delete user $1 ----"
#	sudo deluser $1
#	echo
#}

case "$1" in
	add)
		adduser $2
	;;
	*)
		echo " Usage: sudo $0 add USERNAME "
		exit 1


