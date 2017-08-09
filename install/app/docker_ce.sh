#!/bin/bash

#uninstall old versions
sudo apt-get remove docker docker-engine docker.io

#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "Verify that the key fingerprint is 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88."
sudo apt-key fingerprint 0EBFCD88

#set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update

#install docker-ce
sudo apt-get install docker-ce





