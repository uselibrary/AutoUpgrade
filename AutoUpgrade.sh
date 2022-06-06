#!/usr/bin/env bash

# Auto Upgrade for Debian, Version 0.2
# June 2, 2022. via htttps://PA.CI

# Token and ChatID of telegram bot
Token=
ChatID=

# grep upgradable info, and count of upgradable
apt update
UpgradeInfo=$(apt list --upgradable)
UpgradableCount=$(($(echo -n "$UpgradeInfo" | grep -c '^')-1))

# upgrade
if [ $UpgradableCount -ne 0 ]
then
    apt upgrade -y
    echo "Sleep 5 sec for CPU load."
    sleep 5
    apt autoremove -y
    time=$(date +%F\ %T)
    curl -s -o /dev/null "https://api.telegram.org/bot$Token/sendMessage?chat_id=$ChatID&text=$UpgradableCount upgraded at $time"
    echo "$time" >> /usr/local/AutoUpgrade/upgrade.log
    echo "$UpgradeInfo" >> /usr/local/AutoUpgrade/upgrade.log
    echo ""
fi

# upgrade and log
if [ $UpgradableCount -eq 0 ]
then
    echo "$time" >> /usr/local/AutoUpgrade/upgrade.log
    echo "No upgradable" >> /usr/local/AutoUpgrade/upgrade.log
    echo ""
else

fi