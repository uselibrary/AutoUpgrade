#!/usr/bin/env bash

# install dependencies
apt update
apt install curl wget -y

# install AutoUpgrade and config
mkdir /usr/local/AutoUpgrade
cd /usr/local/AutoUpgrade
touch upgrade.log
wget --no-check-certificate -O AutoUpgrade.sh https://raw.githubusercontent.com/uselibrary/AutoUpgrade/main/AutoUpgrade.sh && chmod +x AutoUpgrade.sh

echo "Do you need telegram notification after upgraded? default No"
read -p "Please input: Y or N" notice

if [ notice -eq Y]
then 


read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
fi


read -p "Please input: Y or N  " notice
echo    # (optional) move to a new line
if [[ ! $notice =~ ^[Yy]$ ]]
then
    echo "Y"
elif [[ ! $notice =~ ^[Yy]$ ]]
then
    echo "N"
else
    exit
fi


read -p "Do you need telegram notification after upgraded (y/n)? " notice
case ${notice:0:1} in
    y|Y )
        echo Yes
        read -p "Plese input Token of telegram bot? " TOKEN
        read -p "Plese input ChatID of telegram bot? " ChatID
        sed -i "s/Token=/${TOKEN}/g" /usr/local/AutoUpgrade/AutoUpgrade.sh
        sed -i "s/ChatID=/${ChatID}/g" /usr/local/AutoUpgrade/AutoUpgrade.sh
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




sed -i "/^Token\b/Id" AutoUpgrade.sh
sed -i "/^ChatID\b/Id" AutoUpgrade.sh
sed -i "/^    curl\b/Id" AutoUpgrade.sh


# contab task