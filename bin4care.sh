#!/bin/bash
export valueID=`/usr/bin/id -u`
export filterSUID=`/usr/bin/find / -perm -4000 2>/dev/null | /usr/bin/awk -F '/' '{print $NF}' | /usr/bin/tr '\n' '|' | /usr/bin/sed 's/|$//' | /usr/bin/sed 's/\([^|]\+\)/^\1$/g'`
echo " ____  _       _  _    ____
| __ )(_)_ __ | || |  / ___|__ _ _ __ ___
|  _ \| | '_ \| || |_| |   / _\` | '__/ _ \\
| |_) | | | | |__   _| |__| (_| | | |  __/
|____/|_|_| |_|  |_|  \____\__,_|_|  \___|"
echo
echo -e "\t            Powered by @n3v3rm1nd8"
echo
echo -e "\t            Tw: @n3v3r___m1nd"
echo

green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"

if [ ! $valueID -eq 0 ]
then
                echo
                echo -e "\n${red}[!] This script needs to be run as a privileged user${end}"
                echo
else
                echo -e "\n${blue}[*] The possible exploitable binaries for privilege escalation that you have are:${end}"
                for data in $(/usr/bin/curl -s -X GET "https://gtfobins.github.io/" | /usr/bin/html2text | /usr/bin/awk '{print$1}' | /usr/bin/tr -d '*' | /usr/bin/grep -vE 'GTFOBins|Star|logo|GTFOBins|securit>
                do
                        echo -e "\n${red}[!] $data ${end} -> ${yellow}https://gtfobins.github.io/gtfobins/$data${end}"
                done
fi
