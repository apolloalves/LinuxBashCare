#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: update__system.sh                                         #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#######################################################################################################################
# The script in question is a Bash script that aims to update operating system packages and optimize performance. It  #
# prompts the user to respond whether they want to update system packages or clean up system packages.                #
#                                                                                                                     #
# If the user chooses to update the packages, the script will perform the following actions:                          #
#                                                                                                                     #
# Will update system packages using  apt update --fix-missing command.                                            #
# It will install the base-files, sosreport and ubuntu-server packages.                                               #
# Will fix broken packages using  apt --fix-broken install.                                                       #
# Will resolve missing dependencies using  apt install -f.                                                        #
# Will upgrade all installed packages using  apt upgrade -y.                                                      #
# Perform a full system upgrade using  apt full-upgrade -y.                                                       #
# Perform a distribution upgrade using  apt dist-upgrade.                                                         #
# Perform a safe upgrade using  aptitude safe-upgrade -y.                                                         #
# Will check for Flatpak updates using flatpak update -y.                                                             #
# If the user chooses to clean up system packages, the script will perform the following actions:                     #
#                                                                                                                     #
# It will remove cache and system log files.                                                                          #
# It will run a series of commands to clear cache files and optimize the system.                                      #
# It will clean the system recycle bin.                                                                               #
# In either case, if the user enters invalid input (other than "y" or "n"), the script will display an error message. #
#                                                                                                                     #
# It is important to note that this script contains commands that require superuser () privileges, so it is       #
# recommended to run it carefully and verify the actions that will be performed before proceeding.                    #
#######################################################################################################################

MENU="LinuxBashCare-10.11.23.sh"

YES="y"
NO="n"

updatePack="update__pack.sh"
removeSystem="remove__system.sh"

echo
echo -n 'Do you want to update system packages (y/n) ? '
read -r updateSytemPackages


if [ "$updateSytemPackages" = "$YES" ]; then
     
     $updatePack

fi

if [ "$updateSytemPackages" = "$NO" ]; then
     echo "skipped!"
     $removeSystem

    
elif [ "$updateSytemPackages" != "$YES" ] && [ "$updateSytemPackages" != "$NO" ]; then
    
    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
    sleep 2
    $MENU

fi

