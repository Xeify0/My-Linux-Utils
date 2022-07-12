#!/bin/bash

key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCBH07WVOvut3vRwOS2kO/eq8+I8s+oFyIWx0yHWybaIVcZlhZzmP76g/zPgPbo+22YDQbj7Mp8nYpILHr+8qcK81AIdM/75Wr2hGgKHR+1RDYWsDeYbro2qnrI19IqfMlU7Ib7CgBjDkNRgBsfd6Xw1kjqTf3Kt9NSWvoog2sKUx8PMXC6q92NSrJS9mkl07MPpPtwDaAjPCASggEBN0VkxUOGyd4gd1w7z+kaVkEkh3kDl9rgpWCx7KXQGO4KVN4Ikbi7TcenvgJ0UPk9OHm+ZTKfsUkN5r2J5soHEsEvB8WnwKSdMPMvCsSvaxLvcKhduWBImOUgt3jjp+vXFw7R rsa-key-20220712"

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