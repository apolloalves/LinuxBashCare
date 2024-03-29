#!/bin/bash
# Check if the user is root
if ((EUID != 0)); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: show__journalctl.sh                                       #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

##################################################################################################################
#                                                                                                                #
# Description:                                                                                                   #
# This script provides options to view and monitor system logs using journalctl. It includes commands to view    #
# failed boot messages, all system logs (including error messages during initialization), check service status,  #
# and monitor syslog. The menu-driven interface simplifies the process of accessing and analyzing system logs.   #
#                                                                                                                #
##################################################################################################################

##################################################################################################################
#                                                                                                                #
# systemctl --failed: The systemctl is a powerful tool for managing services on Linux.                           #
# You can use systemctl to check the status of services and identify failures.                                   #
#  dmesg | grep -i error: The dmesg command checks kernel messages, searching for information about hardware #
# failures or kernel modules.                                                                                    #
# You can execute the following command to check kernel messages:                                                #
# journalctl -b -p err: View all system logs, including boot messages. To see failed boot messages, execute the  #
# following command:                                                                                             #
# journalctl -xe - Catalog page                                                                                  #
#                                                                                                                #
##################################################################################################################

MENU='/bin/LinuxBashCare-10.12.23.sh'
JORNALMENU='show__journalctl.sh'
######################################################################################################################################################################################
LINE_SCRIPT='line_script.sh'
echo -e "\033[1;97;100m        LinuxBashCare System          \033[0m\033[1;30;107m         Apollo Alves         \033[1;97;100m        version  23.04.1        \033[0m"
######################################################################################################################################################################################
echo
# $LINE_SCRIPT
echo -e "\033[01;97m Input an option from the menu: \033[0m"
$LINE_SCRIPT
echo
######################################################################################################################################################################################

echo -e "\033[01;32m[\033[01;37m 1\033[01;32m ]\033[00;37m - View only failed boot messages\033m"
echo -e "\033[01;32m[\033[01;37m 2\033[01;32m ]\033[00;37m - View all system logs, including error messages initialization\033m"
echo -e "\033[01;32m[\033[01;37m 3\033[01;32m ]\033[00;37m - Check service status and identify faults\033m"
echo -e "\033[01;32m[\033[01;37m 4\033[01;32m ]\033[00;37m - Syslog Monitor\033m"
echo -e "\033[01;32m[\033[01;37m E\033[01;32m ]\033[00;37m - Exit\033m"

######################################################################################################################################################################################

echo
$LINE_SCRIPT
formatted_prompt=$(printf "\e[1;97mInput option :\e[0m ")
read -p "$formatted_prompt" option_choice

$LINE_SCRIPT

valid_option=true

if [ "$option_choice" != "e" ] && [ "$option_choice" != "E" ]; then

    if [ "$valid_option" = true ]; then
        # echo -e "\033[05;31mThe option: $option_choice will be executed:\033[00;37m\n"

        case "$option_choice" in
        1)
            journalctl -b -p err
            clear
            $JORNALMENU
            ;;
        2)
            journalctl -xe
            clear
            $JORNALMENU
            ;;
        3)
            journalctl
            clear
            $JORNALMENU
            ;;

        4)
            echo -e "\n\033[01;05;32mMapping system activities...\033[00;37m\n"
            echo -e "\033[1;97mPress Ctrl+C at any time to exit and return to the menu\033[0m"
            # $LINE_SCRIPT
            echo
            sleep 2
            sudo tail -f /var/log/syslog
            clear
            $JORNALMENU
            ;;

        *)
            echo -e "\nInvalid input! Please enter the number contained in the menu!.\n"
            ;;
        esac
        read -rsn1 -p "Press any key to continue..."
        clear
        $JORNALMENU

    fi
else
    echo -e '\nBye!'
    sleep 1 
    $MENU
fi
