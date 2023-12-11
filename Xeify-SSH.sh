#!/bin/bash

key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPvc2wBUmNbOBQ2kBJgUUtRjppsqKFTglId19SypqK6FfLYGFRVzaZOlsJVyefY02I9dZStpbPbV3E9unltyowqHL3uxA0c4xUs5AIGUT7XQ3GeyBK3nAX9Fj8tuhbNMoeWgr/5cD7YAowDdQHUULZfiowrLL+TB0fb5U0jHk10PZIPobJUkGNPd/mvHJei0m6FUGB+Loi/nQ4PIPuwpPnWL+OY6jkb92r6Q8utbJB917Nc95fe/fHhODoRn80Xxt1Ljd487rfXchO8xGBnCuwDd31TJGL5YKR0A/fNgDoax+/heRHGSXfW75NdX6Rbw5KexRN296waxUpz1rOjrDz rsa-key-20231204"

div="-------------------------------------------------------------"

welcome() {

    echo "

░█▀▀▀█ ░█▀▀▀█ ░█─░█ 　 ░█─▄▀ ░█▀▀▀ ░█──░█ 　 ▀█▀ ░█▄─░█ ░█▀▀▀█ ▀▀█▀▀ ─█▀▀█ ░█─── ░█─── ░█▀▀▀ ░█▀▀█ 
─▀▀▀▄▄ ─▀▀▀▄▄ ░█▀▀█ 　 ░█▀▄─ ░█▀▀▀ ░█▄▄▄█ 　 ░█─ ░█░█░█ ─▀▀▀▄▄ ─░█── ░█▄▄█ ░█─── ░█─── ░█▀▀▀ ░█▄▄▀ 
░█▄▄▄█ ░█▄▄▄█ ░█─░█ 　 ░█─░█ ░█▄▄▄ ──░█── 　 ▄█▄ ░█──▀█ ░█▄▄▄█ ─░█── ░█─░█ ░█▄▄█ ░█▄▄█ ░█▄▄▄ ░█─░█
"

echo "
Thank you for installing Xeify's SSH Access Script.
This script will install the SSH key of Xeify to your system to give him temporary access.
This script can be used to install and uninstall the script.
"
}

options() {
    echo $div
    echo " "
    echo "What would you like to do."
    echo " "

    echo "1 | Install my SSH Key"
    echo "2 | Remove my SSH Key"

    read option

}

installKey() {
    cd
    mkdir -p .ssh
    if grep -q "$key" ".ssh/authorized_keys" -s ; then
        echo "| ERROR | \n SSH key is already installed."
    else
        echo "$key" >> ~/.ssh/authorized_keys
        echo "SSH Key has sucessfully been installed!"
    fi
}

removeKey() {
    cd
    if grep -q "$key" ".ssh/authorized_keys" -s ; then
        sed -i '/Xeify/d' .ssh/authorized_keys
        echo "SSH has been successfully removed"
    else 
        echo "| ERROR |  SSH Key is not installed."
    fi
}

welcome
sleep 3s
options
case $option in 
    1)  installKey
    ;;
    2)  removeKey
    ;;
    *)  echo "Invalid Selection, try again: "
    options
esac
