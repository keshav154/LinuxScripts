#!/bin/bash
# menu based system info generator using while 
DELAY=1
while true; do
    clear
        cat << EOF
        Please Select:
        1. Display system information
        2. Display disk space
        3. Display home space utilization
        0. Quit
EOF
    read -p "Enter selection [0-3]"
    case $REPLY in
        0)
            break;
            ;;
        1)
            echo "Hostname" $HOSTNAME
            uptime
            ;;
        2)
            df -h
            ;;
        3)
            if [[ $(id -u) -eq 0 ]]; then
                echo "home space utilization for all users"
                du -sh /home/*
            else
                echo "Home space utilization"
                du -sh $HOME
            fi
            ;;
        *)
            echo "Invalid entry"
            ;;
    esac
    sleep "$DELAY"
done
echo "program terminated"