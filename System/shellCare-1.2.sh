#!/bin/bash
########################################################################################################################
#                                                                                                                      #
#                                                                                                                      #
# THIS PROGRAM CONTAINS ROUTINE AUTOMATION SCRIPTS FOR:                                                                #
#                                                                                                                      #
# FULL KERNEL UPDATE;                                                                                                  #
# COMPLETE UPDATE OF THE LIST OF REPOSITORIES;                                                                         #
# APPLICATION UPDATE VIA FLATPAK UPDATE                                                                                #
# COMPLETE DEVICE DRIVER UPDATE;                                                                                       #
# GRUB UPDATE AFTER KERNEL UPDATE;                                                                                     #
#                                                                                                                      #
# AUTOMATIC REMOVAL AND CORRECTION OF APT/DPKG PACKAGES;                                                               #
# REMOVAL AND CORRECTION OF TRACES OF UNUSED PACKAGES;                                                                 #
# AUTOMATIC REMOVAL OF ORPHANED PACKAGES THAT ONLY OCCUPY SPACES;                                                      #
#                                                                                                                      #
# CLEANING EXCHANGE;                                                                                                   #
# DISK USAGE SPACE SUMMARY;                                                                                            #
#                                                                                                                      #
# IN ADDITION, WE HAVE INCLUDED SCRIPTS TO REMOVE TRACES OF UNUSED DPKGS AND APTS PACKAGES THAT TAKE UP UNNECESSARY    #
# SPACE AND                                                                                                         #
# ALSO REMOVE THE ACCUMULATED KERNEL.                                                                                  #
#                                                                                                                      #
# AUTHOR : APOLLO ALVES                                                                                                                     #
#                                                                                                                      #
########################################################################################################################
# FOR IT TO WORK EFFECTIVELY, WE RECOMMEND INSTALLING SOME DEPENDENCIES:                                               #
########################################################################################################################
# STACER - SYSTEM OPTIMIZER AND MONITOR      #
# HTTPS://GITHUB.COM/OGUZHANINAN/STACER      #
#                                            #
# TRASH-CLI - REMOVAL RUBBISH BIN FILES      #
# HTTPS://GITHUB.COM/ANDREAFRANCIA/TRASH-CLI #
#                                            #
# ORPHANER - REMOVAL OF ORPHAN PACKAGES      #
# SUDO APT INSTALL DEBORPHAN                 #
#                                            #
# TIMESHIFT - SYSTEM RESTORATION             #
# HTTPS://GITHUB.COM/TEEJEE2008/TIMESHIFT    #
##############################################

# Instructions:

# 1 - Download the file;
# 2 - Give him execution privileges (X) as root;
# 3 - Move the file to the /bin directory
# 4 - Run the command in the terminal with sudo

##################################################################################################################
#                                                                                                                #
# ATTENTION!                                                                                                     #
#                                                                                                                #
# AT YOUR OWN RISK, WE ARE NOT RESPONSIBLE FOR ANY SYSTEM FAILURES OR DAMAGES THAT MAY OCCUR WITH YOUR GNU/LINUX #
# DISTRIBUTION.                                                                                                  #
#                                                                                                                #
# THE RESOURCE DEVELOPED IN THIS PROJECT IS COMPLETELY OPEN SOURCE, WE DO NOT TOLERATE IMPROPER DISTRIBUTION OR  #
# FOR PROFIT. MODIFY IT AND DISTRIBUTE IT FOR FREE TO EVERYONE!                                                  #
#                                                                                                                #
# WE ENCOURAGE YOU TO FEEL FREE TO FURTHER IMPROVE OUR CODE. AFTER ALL, THAT'S WHAT THE GNU/LINUX UNIVERSE WAS   #
# BORN FOR!                                                                                                      #
#                                                                                                                #
# # GOOD LUCK! GREETINGS!                                                                                        #
##################################################################################################################
# HIGHLIGHTS COMMANDS                                                                                            #
##################################################################################################################
#                                                                                                                #
# PRINT GOOGLE                                                                                                   #
# echo -e '\033[01;34;47mg\033[01;31mo\033[01;33mo\033[01;34mg\033[01;32ml \033[01;31me\033[00;37;40m'           #
#                                                                                                                #
# PRINT FATAL ERROR "RED" - "BLINK"                                                                              #
# echo -e '\033[05;31merro fatal\033[00;37m'                                                                     #
#                                                                                                                #
# PRINT IN "WHITE BOLD UBUNTU" AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                              #
# echo -e '\033[01;37mubuntu \033[04;32mfocal fossa\033[00;37m!!!'                                               #
#
# OK MESSAGE "WHITE BOLD UBUNTU" AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                              #
# echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#
# DONE MESSAGE AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                              #
# echo -e "\n\033[01;37m[\033[00;32m done\033[00;37m ]\033m\n"
#                                                                                                                #
##################################################################################################################

MENU='shellCare-1.2.sh'
echo
echo
neofetch

/bin/line.sh
echo "Choose an option from the menu"
/bin/line.sh
echo


echo -e "\033[01;32m[\033[01;37m 01\033[01;32m ]\033[00;37m - Update all system packages\033m"
echo -e "\033[01;32m[\033[01;37m 02\033[01;32m ]\033[00;37m - Remove traces of unused packages from the system\033m"
echo -e "\033[01;32m[\033[01;37m 03\033[01;32m ]\033[00;37m - Run both\033m"
echo -e "\033[01;32m[\033[01;37m 04\033[01;32m ]\033[00;37m - Optimize system performance - required sudo\033m"
echo -e "\033[01;32m[\033[01;37m 05\033[01;32m ]\033[00;37m - Check space disks\033m"
echo -e "\033[01;32m[\033[01;37m 06\033[01;32m ]\033[00;37m - Open CLONRAID backups\033m"
echo -e "\033[01;32m[\033[01;37m 07\033[01;32m ]\033[00;37m - Start mysql assistent\033m"
echo -e "\033[01;32m[\033[01;37m 08\033[01;32m ]\033[00;37m - Disable mysql"
echo -e "\033[01;32m[\033[01;37m 09\033[01;32m ]\033[00;37m - Open Broot\033m"
echo -e "\033[01;32m[\033[01;37m 10\033[01;32m ]\033[00;37m - Disable services natives\033m"
echo -e "\033[01;32m[\033[01;37m 11\033[01;32m ]\033[00;37m - Replays all of your boot messages 'journalctl -b'"
echo -e "\033[01;32m[\033[01;37m 12\033[01;32m ]\033[00;37m - Swap State\033m"
echo -e "\033[01;32m[\033[01;37m 13\033[01;32m ]\033[00;37m - Reinstall GNOME gdm3 \033m"
echo -e "\033[01;32m[\033[01;37m 14\033[01;32m ]\033[00;37m - STACER \033m"
echo -e "\033[01;32m[\033[01;37m 15\033[01;32m ]\033[00;37m - Start volume balancing \033m"
echo -e "\033[01;32m[\033[01;37m 16\033[01;32m ]\033[00;37m - Create Penguin's Eggs \033m"


echo -e "\033[01;32m[\033[01;37m q\033[01;32m ]\033[00;37m  - QUIT\033m"
echo
/bin/line.sh
read -p "Option: " option_choice
/bin/line.sh

if ! $option_choice 2>/dev/null && [ -z "$option_choice" ]; then
  echo "$option_choice"


fi

function updateSystem {
    echo -e "\n Updating system packages...\n" 
    sleep 1

    sudo apt update -y 
    sudo apt update --fix-missing
    sudo apt install aptitude -y
    sudo apt upgrade -y
    sudo apt install base-files sosreport ubuntu-server
    sudo apt dist-upgrade -y 
    sudo apt full-upgrade -y
    sudo apt --fix-broken install 
    sudo apt install -f
    echo -e "\n\033[00;37mChecking for flatpak updates...\033[00;37m"
    flatpak update -y
    echo -e "\n\033[01;37m[\033[00;32m all done!\033[00;37m ]\033m\n"

}

function removeTracer {
   
    echo -e "\n Removing junk system files..."
    sleep 2
    #####################################################################################################################
    echo -e "\nRemoving cache and logs files system...\n"
    #####################################################################################################################

    sudo rm -rfv /var/lib/apt/lists/lock
    sudo rm -rfv /var/lib/dpkg/lock-frontend
    sudo rm /var/lib/apt/lists/* -vf
    sudo rm -rfv /var/lib/dpkg/lock
    sudo rm -rfv ~/.cache/thumbnails/*
    sudo rm -rfv ~/.cache/thumbnails/normal/*
    sudo rm -rfv /var/cache/apt/archives/lock
    sudo rm -rfv ~/.cache/tracker/
    sudo rm -Rfv /var/log/*
    
    sudo /bin/remove__oldsnaps.sh
    sudo apt --purge autoremove -y

    sudo apt autoclean -y
    sudo apt -s clean
    sudo apt clean -y
    sudo apt clean all

    sudo apt remove $(deborphan)
    echo -e "\n\033[01;37m[\033[00;32m \033[00;37m ]\033m\n"

    sleep 1
    #####################################################################################################################
    echo -e "\nRemoving Rubbish Bin files...\n"
    #####################################################################################################################
    trash-empty -f
    sudo rm -rfv /home/apollo__nicolly/.local/share/recently-used.xbel
    sudo rm -rfv .local/share/Trash/*
    sudo rm -rfv /home/*/.local/share/Trash/*/**
    sudo rm -rfv /root/.local/share/Trash/*/**
    echo -e "\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"
    # sudo /bin/cls.sh

}

function cleanupdateSystem {
    
    echo -e "\nCleaning and updating the system...\n"
    sleep 1
    sudo /bin/fix__packages-7.0.sh
    echo

}

function systemPerformace {

    echo -e "Option 4 choosen"
    echo -e "\n\033[01;32mOptimizing system performance...\033[00;37m\n"
    
    sleep 1
    echo -e "\n\033[01;32mCleaning drop_caches...\033[00;37m\n"
	
    sudo sync; echo 1 > /proc/sys/vm/drop_caches
	sudo sync; echo 2 > /proc/sys/vm/drop_caches
	sudo sync; echo 3 > /proc/sys/vm/drop_caches

    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    #####################################################################################################################
    #PRELINK
    #####################################################################################################################
    echo -e "\n\033[01;32mExecuting prelink...\033[00;37m\n"
    sleep 1
    sudo prelink -amR
    sudo /etc/cron.daily/prelink
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    sleep 1
    
    #####################################################################################################################
    #RAM MEMORY
    #####################################################################################################################
    echo -e "\n\033[01;32mCleaning RAM memory...\033[00;37m\n"
    sleep 1 
    sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
    sleep 1 
    echo -e "\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"
    #####################################################################################################################
}
  
function checkSpace {
    
    echo -e "\n Check spaces...\n"
    sleep 1 
    df -h / && echo "" && df -h /home && echo "" && df -h /mnt/EXT@ST500LM012__CLONRAID && echo "" &&  df -h /mnt/EXT@ST500LM012__STORAGE/
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    
}

function nautilusDir {

    echo -e "\n Opening Nautilus...\n"
    sleep 2
    nautilus /mnt/EXT@ST500LM012__CLONRAID/ && >/dev/null
    clear
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    echo
}

function mysqlAssitent { 
    sudo /bin/mysql__fix-1.0.sh

}

function stacer { 
    sudo /bin/stacer.sh 
}


function mysqlDisableService {

    echo -e "Disabling mysql service..."
    sudo systemctl disable mysql.service
    sleep 1
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
   
}

function broot {
    
    echo -e "\nOpening broot...\n"
    sleep 1
    sudo broot
    sleep 1
}

function disableNativeServicesSystem {
    
    echo -e "\nDisabling natives services system...\n"
    sudo disable__services.sh
}

function showJournalctl {
    
    echo -e "\nLoading journalctl -b...\n"
    sleep 1
    journalctl -b
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

}

function eggsCreate {

    echo -e "\nOpening new tab exclusive for Eggs...\n"
    sleep 1
    echo -e "\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    gnome-terminal --tab -- bash -c "sudo eggs produce --clone --basename=Ubuntu-jammy-22.04-LTS-NicollyApollo"
}

function gnomeGdm3 {

echo -e "\n\033[01;32mReinstalling gdm3...\033[00;37m\n"
sleep 2
sudo apt install gdm3 -y
echo -e "\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"
}

function mountDisk {
    echo -n 
    sudo /bin/ext__disk-1.0.sh

}


function balanceVolume {

    /bin/btrfs_balance.sh
}

case "$option_choice" in


 1)
    
    updateSystem
    /bin/line.sh
    $MENU
    ;;
2)
    removeTracer
    $MENU
    ;;
3)
    cleanupdateSystem
    $MENU
    ;;
4)
    systemPerformace
    $MENU
    ;;
5)
    checkSpace
    $MENU
    ;;

6)
    nautilusDir
    $MENU
    ;;
7)
    mysqlAssitent
    ;;
8)
    mysqlDisableService
    $MENU
    ;;
9)
    broot
    $MENU
    ;;
10)
    disableNativeServicesSystem
    $MENU
    ;;
11)
    showJournalctl
    $MENU
    ;;
12)
    swapState
    $MENU
    ;;
13)
    gnomeGdm3
    $MENU
    ;;

14)
    stacer
    $MENU
    ;;
15)
    balanceVolume
    $MENU
    ;;
16)
    eggsCreate
    $MENU
    ;;

q)
    echo
    echo "Exiting the program..."
    sleep 1
    clear
    ;;

esac