#!/bin/sh

# File executed as root on boot
# To change this, modify /etc/rc.local

# To check partitions composition :
# sudo fdisk -l

mount /dev/sda1 /media/softs
if [ $? -eq 0 ]; then
  # Read Only Mount
  mount -r /dev/sda1 /media/softs
fi

mount /dev/sda2 /media/files
if [ $? -eq 0 ]; then
  # Read Only Mount
  mount -r /dev/sda2 /media/files
fi
