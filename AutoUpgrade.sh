#!/usr/bin/env bash

# Token and ChatID of telegram bot
Token=
ChatID=

# grep upgradable info, and count of upgradable
UpgradeInfo=$(apt list --upgradable)
UpgradableCount=$(($(echo -n "$UpgradeInfo" | grep -c '^')-1))

# upgrade

if [$UpgradableCount != 0 ]
then
    apt update
    apt upgrade -y
    echo "Sleep 5 sec for CPU load."
    sleep 5
    apt autoremove -y
    time=$(date +"%T")
    curl -s -o /dev/null "https://api.telegram.org/bot$Token/sendMessage?chat_id=$ChatID&text=$UpgradableCount upgraded at $time"
    echo "$time" >> /usr/local/AutoUpgrade/upgrade.log
    echo "$UpgradeInfo"
fi

# case $UpgradableCount in  
#     0) echo 'No upgradable available'
#     ;;
#     *) echo 'Upgrading'
#     apt upgrade -y
#     apt autoremove -y
#     time=$(date +"%T")
#     curl -s -o /dev/null "https://api.telegram.org/bot$Token/sendMessage?chat_id=$ChatID&text=$UpgradableCount upgraded at $time"
#     ;;
# esac


