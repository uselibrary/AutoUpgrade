#!/usr/bin/env bash

# install dependencies
apt update
apt install curl wget -y

# install AutoUpgrade
mkdir /usr/local/AutoUpgrade
cd /usr/local/AutoUpgrade
touch upgrade.log
wget --no-check-certificate -O AutoUpgrade.sh https://raw.githubusercontent.com/uselibrary/AutoUpgrade/main/AutoUpgrade.sh && chmod +x AutoUpgrade.sh

# AutoUpgrade config
read -p "Do you need telegram notification after upgraded (y/n)? " notice
case ${notice:0:1} in
    y|Y )
        echo Yes
        read -p "Plese input Token of telegram bot? " TOKEN
        read -p "Plese input ChatID of telegram bot? " ChatID
        sed -i "s/Token=/Token=${TOKEN}/g" /usr/local/AutoUpgrade/AutoUpgrade.sh
        sed -i "s/ChatID=/ChatID=${ChatID}/g" /usr/local/AutoUpgrade/AutoUpgrade.sh
    ;;
    n|N )
        sed -i "/^Token\b/Id" /usr/local/AutoUpgrade/AutoUpgrade.sh
        sed -i "/^ChatID\b/Id" /usr/local/AutoUpgrade/AutoUpgrade.sh
        sed -i "/^    curl\b/Id" /usr/local/AutoUpgrade/AutoUpgrade.sh
    ;;
    * )
        echo "Wrong Input! EXIT..."
        exit
    ;;
esac

# contab task
crontab -l | { cat; echo "0 3 * * * /bin/bash /usr/local/AutoUpgrade/AutoUpgrade.sh"; } | crontab -

echo "AutoUpgrade Installed"
echo "System will upgrade automatically everyday at 3am."