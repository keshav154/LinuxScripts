#!/bin/bash
# interactive script to know your linux server details"
clear
echo "
Please Select:

   1. Display System Information
   2. Display Disk Space
   3. Display Home Space Utilization
   0. Quit
"
read -p "Enter selection [0-3] > "

if [[ $REPLY =~ ^[0-3]$ ]]; then
    if [[ $REPLY == 0 ]]; then
        echo "Program Terminated"
        exit
    fi
    if [[ $REPLY == 1 ]]; then
        echo "Hostname: $HOSTNAME"
        uptime
        exit
    fi
    if [[ $REPLY == 2 ]]; then
        df -h
        exit
    fi
    if [[ $REPLY == 3 ]]; then
        if [[ $(id -u) -eq 0 ]]; then
            echo "Home Space Utilization (all users)"
            du -sh /home/*
        else 
            du -sh $HOME
        fi
        exit
    fi
else
    echo "Invalid entry" >&2
    exit 1
fi       