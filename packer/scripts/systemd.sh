#!/bin/sh
# set upstart instead of systemd on ubuntu 15.04 because vagrant has issues
if [ `lsb_release -rs` = "15.04" ]; then
  sudo apt-get install -y upstart-sysv
  sudo update-initramfs -u
fi
