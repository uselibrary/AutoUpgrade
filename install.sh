#!/usr/bin/env bash

# update and install dependencies
apt update
apt install curl wget -y

mkdir /usr/local/AutoUpgrade
cd /usr/local/AutoUpgrade
wget --no-check-certificate -O AutoUpgrade.sh https://raw.githubusercontent.com/uselibrary/AutoUpgrade/main/AutoUpgrade.sh && chmod +x AutoUpgrade.sh
