#!/bin/bash

# Чтение конфигурационного файла
source config.cfg 2>/dev/null

# Подключаем вспомогательные файлы
source "$(dirname "${BASH_SOURCE[0]}")/color_utils.sh"
source "$(dirname "${BASH_SOURCE[0]}")/print_utils.sh"

# Функция для вывода цветовой схемы
function print_color_scheme() {
    echo "Column 1 background = ${column1_background:-default} (${colorArrayBack[$column1_background]:-$back_black})"
    echo "Column 1 font color = ${column1_font_color:-default} (${colorArrayFore[$column1_font_color]:-$fore_white})"
    echo "Column 2 background = ${column2_background:-default} (${colorArrayBack[$column2_background]:-$back_red})"
    echo "Column 2 font color = ${column2_font_color:-default} (${colorArrayFore[$column2_font_color]:-$fore_blue})"
}

# Вывод информации о системе с заданными цветами или цветовой схемой по умолчанию
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

# Отступ перед выводом цветовой схемы
echo ""

# Вывод цветовой схемы
print_color_scheme
