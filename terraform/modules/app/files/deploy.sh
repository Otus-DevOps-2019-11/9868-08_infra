#!/bin/bash
set -e

APP_DIR=${1:-$HOME}

sudo fallocate -l 1G /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo  "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
echo  "swapon /swapfile" | sudo tee -a /etc/sysctl.conf

git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install

sudo cp /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
