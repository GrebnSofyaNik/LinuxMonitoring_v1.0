#!/bin/bash

function print_system_info() {
    HOSTNAME=$(hostname)
    TIMEZONE=$(date +'%Z %:z')
    USER=$(whoami)
    OS=$(lsb_release -d | awk -F"\t" '{print $2}')
    DATE=$(date +'%d %B %Y %H:%M:%S')
    UPTIME=$(uptime -p)
    UPTIME_SEC=$(cut -d' ' -f2 <<< "$UPTIME")
    IP=$(hostname -I | awk '{print $1}')
    MASK=$(ifconfig | grep -A 1 'inet' | awk '/Mask/{print $4}')
    GATEWAY=$(ip route | grep default | awk '{print $3}')
    RAM_TOTAL=$(free -g | awk '/^Mem/{print $2}')
    RAM_USED=$(free -g | awk '/^Mem/{print $3}')
    RAM_FREE=$(free -g | awk '/^Mem/{print $4}')
    SPACE_ROOT=$(df -m / | awk '/\//{print $2}')
    SPACE_ROOT_USED=$(df -m / | awk '/\//{print $3}')
    SPACE_ROOT_FREE=$(df -m / | awk '/\//{print $4}')

    echo "HOSTNAME = $HOSTNAME"
    echo "TIMEZONE = $TIMEZONE"
    echo "USER = $USER"
    echo "OS = $OS"
    echo "DATE = $DATE"
    echo "UPTIME = $UPTIME"
    echo "UPTIME_SEC = $UPTIME_SEC"
    echo "IP = $IP"
    echo "MASK = $MASK"
    echo "GATEWAY = $GATEWAY"
    echo "RAM_TOTAL = $RAM_TOTAL GB"
    echo "RAM_USED = $RAM_USED GB"
    echo "RAM_FREE = $RAM_FREE GB"
    echo "SPACE_ROOT = $SPACE_ROOT MB"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB"
}

print_system_info
