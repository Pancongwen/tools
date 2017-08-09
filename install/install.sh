#!/bin/bash

case "$1" in
  all)
    sudo apt install -r list.txt
    cd app
    ./* 
    ;;
  docker)
    DOCKER_CE
    ;;
  *)
    echo "Usage:  $0 all	see what can install"
    echo "        $0 [appname] 	install [appname]"  



