#!/bin/bash
export valueID=`/usr/bin/id -u`
export filterBinary=`/usr/bin/find / -perm -4000 -user root 2>/dev/null | /usr/bin/awk -F '/' '{print $NF}' | /usr/bin/tr '\n' '|' | /usr/bin/sed 's/|$//' | /usr/bin/sed 's/\([^|]\+\)/^\1$/g'`
export filterCapabilitie=`/usr/sbin/getcap -r / 2>/dev/null | /usr/bin/awk -F ' ' '{print $1}' | awk -F '/' '{print $NF}' | /usr/bin/tr '\n' '|' | /usr/bin/sed 's/|$//' | /usr/bin/sed 's/\([^|]\+\)/^\1$/g'`
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
                echo -e "\n${green}[¿?] If one or both fields appear without any results, it means that you don't have exploitable binaries or capabilities that appear in 'gtfobins', that's a good sign for your security ;)${end}\n"
                echo -e "\n${blue}[*] Binaries exploitable:${end}"
                for binary in $(curl -s -X GET "https://gtfobins.github.io/" | /usr/bin/html2text | /usr/bin/awk '{print $1}' | /usr/bin/tr -d '*' | /usr/bin/grep -vE 'GTFOBins|Star|logo|GTFOBins|secus|security|The|to|privileges|other|It|listed|how|GTFOBins|where|If|Binary|No' | /usr/bin/tr -d '[' | /usr/bin/tr -s '\n' | grep -E "$filterBinary")
                do
                        echo -e "\n${red}[!] $binary ${end} -> ${yellow}https://gtfobins.github.io/gtfobins/$binary${end}"
                done
                echo -e "\n\n${blue}[*] Capabilities exploitable:${end}"
                for capabilitie in $(/usr/bin/curl -s -X GET "https://gtfobins.github.io/#+capabilities" | /usr/bin/html2text | /usr/bin/grep -n "Capabilities" -B 5 | /usr/bin/awk '{print $1}' | /usr/bin/awk -F '-' '{print $NF}' | /usr/bin/grep -v ':' | /usr/bin/tr -s '\n' | /usr/bin/grep -E "$filterCapabilitie")
                do
                        echo -e "\n${red}[!] $capabilitie ${end} -> ${yellow}https://gtfobins.github.io/gtfobins/$capabilitie${end}"
                done
fi
