#!/bin/bash

# Подключаем вспомогательные файлы
source "$(dirname "${BASH_SOURCE[0]}")/color_utils.sh"

# Функция для вывода информации с заданными цветами
function print_colored_info() {
    local name="$1"
    local value="$2"
    echo -e "${bg_color}${font_color}${name}${reset_color} = ${value_bg_color}${value_font_color}${value}${reset_color}"
    }
