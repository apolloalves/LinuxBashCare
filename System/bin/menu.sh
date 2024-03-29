#!/bin/bash
#########################################################################
#                                                                       #
# Script: menu.sh - Item Menu                                           #           
# Author: Apollo Alves                                                  #
# Date: 16/12/2023                                                      #
#                                                                       #
#########################################################################

##########################################################################################################
#                                                                                                        #
# Description: This bash script provides a menu with various system-related options for easy management. #
# Each option corresponds to a specific task, such as updating system packages, optimizing performance,  #
# checking system boot time, disabling native services, and more.                                        #
#                                                                                                        #
##########################################################################################################

options=(

    #1
    "Update all system packages"
    #2
    "Scan the system for traces of unused packages"
    #3
    "Run both"
    #4
    "Optimize system performance "
    #5
    "Open STACER manager"
    #6
    # "Swap State"
    #7
    "Check system boot time"
    #8
    "Boot messages wizard ( journalctl -b )"
    #9
    # "Disable services natives"
    #10
    # "List of disabled services"
    #11
    "Mount External Disks"
    #12
    "Check space disks"
    #13
    "Egss Wizard"
    #14
    "Open CLONRAID backups"
    #15
    # "Manage packages with aptitude"
    #16
    # "Manage packages and drivers"
    #17
    # "Reinstall GNOME gdm3"
    #18
    "mysql wizard"
    #19
    # "Check if a new version of Ubuntu is available"
    #20
    "Start Virtualbox services"
    #21
    "Linux Report Machine"
    #22
    "Change old version for ShellCare-22.0.1.sh"
    #23
    "Reboot System"
    #22
    "QUIT"

)
