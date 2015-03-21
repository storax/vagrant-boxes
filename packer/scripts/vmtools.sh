#!/bin/bash

mkdir /tmp/vbox
VER=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VER.iso /tmp/vbox 
sh /tmp/vbox/VBoxLinuxAdditions.run
umount /tmp/vbox
rmdir /tmp/vbox
rm /home/vagrant/*.iso
ln -s /opt/VBoxGuestAdditions-*/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
