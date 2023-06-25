#!/bin/bash

#####################################################################
#                                                                   #
# Script: For updates packages of system and optimizer performance. #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 03/06/2023                                                  #
#                                                                   #
#####################################################################

YES="y"
NO="n"
echo -n 'Do you want to update system packages (y/n)? '
read -r packages_question

if [ "$YES" = "$packages_question" ]; then
    sleep 1
    echo -e "\nUpdating system packages...\n"
    #####################################################################################################################
    echo -e "\nCleaning and updating the system...\n"
    #####################################################################################################################

    sudo apt update --fix-missing
    sudo apt install base-files sosreport ubuntu-server
    sudo apt --fix-broken install
    sudo apt install -f
    sudo apt install aptitude -y
    sudo apt upgrade -y
    sudo apt full-upgrade -y
    sudo apt dist-upgrade
    sudo aptitude safe-upgrade -y

    echo -e "\n\033[00;37mChecking for flatpak updates...\033[00;37m"
    flatpak update -y
    echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

elif [ "$NO" = "$packages_question" ]; then
    echo -n 'Do you want to clean system packages (y/n)? '
    read -r removepack_kernel

    if [ "$YES" = "$removepack_kernel" ]; then
        #####################################################################################################################
        echo -e "\nRemoving cache and log files...\n"
        #####################################################################################################################

        sudo rm -rfv /var/lib/apt/lists/lock
        sudo rm -rfv /var/lib/dpkg/lock-frontend
        sudo rm -rfv /var/lib/apt/lists/* -vf
        sudo rm -rfv /var/lib/dpkg/lock
        sudo rm -rfv ~/.cache/thumbnails/*
        sudo rm -rfv ~/.cache/thumbnails/normal/*
        sudo rm -rfv /var/cache/apt/archives/lock
        sudo rm -rfv ~/.cache/tracker/
        sudo rm -Rfv /var/log/*

        echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

        sudo apt autoclean -y
        sudo apt -s clean
        sudo apt clean -y
        sudo apt clean all
        sudo apt purge --autoremove
        sudo apt remove "$(deborphan)"
        sudo /bin/remove__oldsnaps.sh
        echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
        sudo dpkg --configure -a
        sudo apt --fix-broken install
        sleep 1
        sudo rm -rfv /home/apollo__nicolly/.local/share/recently-used.xbel
        echo -e "\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"
        #####################################################################################################################
        echo -e "\nRemoving Rubbish Bin files...\n"
        #####################################################################################################################
        sudo rm -rfv .local/share/Trash/*
        sudo rm -rfv /home/*/.local/share/Trash/*/**
        sudo rm -rfv /root/.local/share/Trash/*/**

        echo -e "\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"
    fi

fi

if
    echo "${VALIDATE}"
then

    echo -e "command not found!\n"
    $MENU

fi
