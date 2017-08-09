#!/bin/bash

#youdao-dict need dependence "gstreamer0.10-plugins-ugly",
#but this dependecce is not exist in ubuntu16.04
#so we need to delete this dependence before install youdao-dict

sudo apt update
sudo apt -f install
sudo apt upgrade

wget http://codown.youdao.com/cidian/linux/youdao-dict_1.1.0-0-ubuntu_amd64.deb

mkdir youdao-dict
dpkg -X ./youdao-dict_1.1.0-0-ubuntu_amd64.deb  ./youdao-dict

dpkg -e ./youdao-dict_1.1.0-0-ubuntu_amd64.deb ./youdao-dict/DEBIAN

sed -i -e "s/, gstreamer0.10-plugins-ugly/ /g" youdao-dict/DEBIAN/control

sudo dpkg-deb -b youdao-dict youdaobuild.deb

sudo dpkg -i youdaobuild.deb

sudo rm -rf youdao-dict_1.1.0-0-ubuntu_amd64.deb youdao-dict
