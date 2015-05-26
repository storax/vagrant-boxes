#!/bin/sh -eux

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get remove -y --purge xserver-xorg
sudo apt-get install -y xserver-xorg
sudo dpkg-reconfigure xserver-xorg
