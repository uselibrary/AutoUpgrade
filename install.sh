#!/usr/bin/env bash

# install dependencies
apt update
apt install curl wget -y

# install AutoUpgrade and config
mkdir /usr/local/AutoUpgrade
cd /usr/local/AutoUpgrade
touch upgrade.log
wget --no-check-certificate -O AutoUpgrade.sh https://raw.githubusercontent.com/uselibrary/AutoUpgrade/main/AutoUpgrade.sh && chmod +x AutoUpgrade.sh
