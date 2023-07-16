#!/bin/bash

#####################################################################
#                                                                   #
# Script: swapState.sh                                              #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

####################################################################################################################################
#                                                                                                                                  #
# Description : This shell script called "swapState.sh" displays the state of the system's swap memory. Here is a summary of what  #
# it does:                                                                                                                         #
#                                                                                                                                  #
# 1. Displays a message indicating that the state of swap memory will be shown.                                                    #
# 2. Use the "free -h" command to display information about memory usage, including swap memory.                                   #
# 3. Displays a line using the "$LINE" variable, which prints a line for each executed command.                                    #
# 4. Displays a message indicating that the operation is complete.                                                                 #
# 5. Wait 2 seconds.                                                                                                               #
#                                                                                                                                  #
# In short, the script displays information about the system's swap memory usage, providing a view of the current                  #
# state of memory. This can be useful for monitoring memory usage and identifying whether swap memory is being used by the system. #
#                                                                                                                                  #
####################################################################################################################################
echo -e "\nSwap Sate\n"
free -h
$LINE
echo -e "\n\033[01;37m[\033[00;32m done\033[00;37m ]\033m\n"
sleep 4
