#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi

#####################################################################
#                                                                   #
# Script: cleanup__swap.sh                                          #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################
##################################################################################################################
#                                                                                                                #
# Description:                                                                                                   #
# This script checks if the user has root privileges. If not, it exits with an error message.                    #
# It then prompts the user to decide whether to remove the contents of the swap space. If the user chooses 'y',  #
# it proceeds to clean the swap space, turning it off and on to free up space. The script also adjusts the       #
# swappiness value to improve system performance.                                                                #
#                                                                                                                #
##################################################################################################################

MENU="/bin/ShellCare-22.0.1.sh"
SWAPPINESS=$(cat /proc/sys/vm/swappiness)
LINE_SCRIPT='line_script.sh'
YES="y"
NO="n"

# Function to calculate size in GiB or MB
function calculate_size() {
    local size_in_kb=$1
    if ((size_in_kb >= 1024)); then
        echo "$((size_in_kb / 1024)) GiB"
    else
        echo "$size_in_kb MB"
    fi
}

echo
free -h  # Adiciona o comando free -h aqui para mostrar o status antes da limpeza
echo

read -rp 'Would you like to remove all contents of swap? (y/n): ' removeSwap

case "$removeSwap" in
"$YES")
    echo -e '\nAttention all data contained will be lost! And other running processes may be affected.'
    echo -e 'Please save all your work before continuing.\n'
    read -rp 'Do you really want to proceed (y/n)? ' proceed

    case "$proceed" in
    "$YES")
        echo -e "\n\033[01;32mCleaning Swap...\033[00;37m\n"
        # Get occupied space before cleaning
        used_before=$(free -k | awk '/^Swap:/ {print $3}')
        echo "Used swap space before: $(calculate_size $used_before)"

        swapoff -a
        # We don't delete the swap partition, we just turn it on and off to free up the space
        swapon -a

        # Get occupied space after cleaning
        used_after=$(free -k | awk '/^Swap:/ {print $3}')
        echo "Used swap space after: $(calculate_size $used_after)"

        removed_space=$((used_before - used_after))
        echo "Removed swap space: $(calculate_size $removed_space)"

        echo -e "\n\033[01;37m[\033[00;32m Swap data was cleaned \033[01;37m ]\033m\n"
        echo
        echo -e "\033[01;32mActivating swap...\033[00;37m\n"
        swapon -a -v
        sysctl -w vm.swappiness=10
        SWAPPINESS=$(cat /proc/sys/vm/swappiness)
        echo
        free -h  # Adiciona o comando free -h aqui para mostrar o status após a limpeza
        echo
        echo -e "swappiness set: $SWAPPINESS"
        echo -e "\n\033[01;37m[\033[00;32m Swap is active now! \033[01;37m ]\033m\n"
        ;;
    "$NO")
        echo "Operation aborted!"
        sleep 2 
        $MENU
        ;;
    *)
        echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
        ;;
    esac
    ;;
"$NO")
    echo "Operation skipped!"
    $MENU
    ;;
*)
    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
    ;;
esac