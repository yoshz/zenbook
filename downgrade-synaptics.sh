#!/bin/bash -e

# From: https://github.com/iberianpig/xSwipe#install-older-version-synaptics-driver-that-is-compatible-with-xswipe

sudo apt-get install -y git build-essential libevdev-dev autoconf automake libmtdev-dev xorg-dev xutils-dev libtool
sudo apt-get remove -y xserver-xorg-input-synaptics
git clone https://github.com/Chosko/xserver-xorg-input-synaptics.git
cd xserver-xorg-input-synaptics
./autogen.sh
./configure --exec_prefix=/usr
make
sudo make install
rm -rf xserver-xorg-input-synaptics

