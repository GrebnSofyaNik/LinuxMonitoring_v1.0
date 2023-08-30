#!/bin/bash

# Подключаем вспомогательные файлы
source "$(dirname "${BASH_SOURCE[0]}")/color_utils.sh"
source "$(dirname "${BASH_SOURCE[0]}")/print_utils.sh"

# Вывод информации о системе с заданными цветами
print_colored_info "HOSTNAME" "$(hostname)"
print_colored_info "TIMEZONE" "$(date +'%Z %:z')"
print_colored_info "USER" "$(whoami)"
print_colored_info "OS" "$(lsb_release -d | awk -F"\t" '{print $2}')"
print_colored_info "DATE" "$(date +'%d %B %Y %H:%M:%S')"
print_colored_info "UPTIME" "$(uptime -p)"
print_colored_info "UPTIME_SEC" "$(cut -d' ' -f2 <<< "$(uptime -p)")"
print_colored_info "IP" "$(hostname -I | awk '{print $1}')"
print_colored_info "MASK" "$(ifconfig | grep -A 1 'inet' | awk '/Mask/{print $4}')"
print_colored_info "GATEWAY" "$(ip route | grep default | awk '{print $3}')"
print_colored_info "RAM_TOTAL" "$(free -g | awk '/^Mem/{print $2}') GB"
print_colored_info "RAM_USED" "$(free -g | awk '/^Mem/{print $3}') GB"
print_colored_info "RAM_FREE" "$(free -g | awk '/^Mem/{print $4}') GB"
print_colored_info "SPACE_ROOT" "$(df -m / | awk '/\//{print $2}') MB"
print_colored_info "SPACE_ROOT_USED" "$(df -m / | awk '/\//{print $3}') MB"
print_colored_info "SPACE_ROOT_FREE" "$(df -m / | awk '/\//{print $4}') MB"
