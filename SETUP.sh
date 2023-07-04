#!/bin/bash
red="\e[0;31m\033[1m"
end="\033[0m\e[0m"

export valueID=`/usr/bin/id -u`

if [ ! $valueID -eq 0 ]
then
                echo
        echo -e "${red}[!] This script needs to be run as a privileged user${end}"
        echo
else
                /usr/bin/sudo /usr/bin/apt update
                /usr/bin/sudo /usr/bin/apt install html2text -y
                /usr/bin/sudo /usr/bin/apt install findutils -y
                /usr/bin/sudo /usr/bin/apt install coreutils -y
                /usr/bin/sudo /usr/bin/apt install sed -y
                /usr/bin/sudo /usr/bin/apt install grep -y
                /usr/bin/sudo /usr/bin/apt install curl -y
                /usr/bin/sudo /usr/bin/apt install gawk -y
fi