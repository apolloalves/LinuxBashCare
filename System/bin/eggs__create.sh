#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: eggs__create.sh                                           #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#####################################################################

########################################################################################################################
#                                                                                                                      #
# Description : This is a shell script called "eggsCreate.sh". Here is an overview of what the script does:            #
#                                                                                                                      #
# 1. Set the FILEPATH and TARGETPATH variables to the source and destination ISO file paths, respectively.             #
# 2. Checks the device and mounts the mount point specified in $TARGETPATH.                                            #
# 3. Gets the current date and stores it in the $DATE variable.                                                        #
# 4. Checks for .iso files in the /home/eggs directory.                                                                #
# 5. If there are .iso files, displays the files found, renames the first file to "Ubuntu-22.0.4-LTS_current_data.iso" #
# and                                                                                                                  #
# moves it to $TARGETPATH.                                                                                             #
# 6. If there are no .iso files, displays a message that no files were found and opens a new terminal to run a command #
# called " eggs produce --clone --prefix=Ubuntu-22.04.2-LTS --basename= _current date".                            #
#                                                                                                                      #
# In short, this script checks for .iso files in the /home/eggs directory. If so, it renames the first file found and  #
# moves it to a specified destination. If there are no .iso files, execute another specific command. It is important   #
# to mention that the script contains some commands that require superuser () privileges.                          #
#                                                                                                                      #
########################################################################################################################


FILEPATH="/home/eggs/*.iso"
TARGETPATH="/mnt/VENTOY"
CLONRAID="/mnt/EXTST500LM012__CLONRAID/UBUNTU_EGGS/"
LINE_SCRIPT='line_script.sh'

echo -e "\nChecking devices..."
sleep 2
mount /dev/sdc1 $TARGETPATH
mount /dev/sdc3 /mnt/EXTST500LM012__CLONRAID/

DATE=$(date +"%Y-%m-%d")
arquivo="/home/eggs/*.iso"

while true; do

     length=$(find /home/eggs -maxdepth 1 -name "*.iso" | wc -l)

     if [ "$length" -gt 0 ]; then

          echo ".iso file(s) found in: "
          echo
          find /home/eggs -maxdepth 1 -name "*.iso" -exec echo "- {}" \;

          echo -e "\nwait...\n"
          echo -e "Moving file to $TARGETPATH ...\n"
          mv -v /home/eggs/*.iso /home/eggs/Ubuntu-22.0.4-LTS_$DATE.iso
          
          echo -e "\n\033[01;05;37mRenamed your iso file to : 'Ubuntu-22.0.4-LTS_$DATE.iso'!\033[00;37m\n"
          echo -e "\npreparing to move...\n"
          sleep 1
          time mv -v /home/eggs/*.iso /mnt/VENTOY
          echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

          echo "creating a backup for : '$CLONRAID'"
          rsync -avh --progress $TARGETPATH/Ubuntu-22.0.4-LTS_$DATE.iso $CLONRAID
          gnome-terminal --tab -- bash -c "watch df -h /mnt/EXTST500LM012__CLONRAID/"
          
          echo "Opening Google Drive..."
          brave-browser --profile-directory=Default --app-id=aghbiahbpaijignceidepookljebhfak &
          echo -e "\n\033[01;05;37mupload the file : 'Ubuntu-22.0.4-LTS_$DATE.iso' to Google Drive now!!\033[00;37m\n"
          $LINE_SCRIPT'
          break
     else
          # EGGS NEW WINDOW
          echo -e "\nWait...\n"
          sleep 2
          echo -e "No .iso file found in /home/eggs/"
          sleep 2
          echo -e "\nOpening new tab exclusive for Eggs...\n"
          sleep 1
          gnome-terminal --tab -- bash -c " eggs produce --clone --prefix=Ubuntu-22.04.2-LTS --basename=_$DATE"
          echo -e '\033[01;06;37mThe new tab is open!\033[00;37m'
          break
     fi
done
