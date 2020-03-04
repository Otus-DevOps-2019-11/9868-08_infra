#!/bin/bash

sudo fallocate -l 1G /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo  "swapon /swapfile" | sudo tee -a /etc/sysctl.conf
echo  "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf

set -e

sudo mv -f /tmp/mongod.conf /etc/mongod.conf
sudo systemctl restart mongod

