#!/bin/bash

# Проверка наличия 4 числовых параметров
if [ $# -ne 4 ]; then
    echo "Usage: $0 <background_color> <font_color> <value_background_color> <value_font_color>"
    exit 1
fi

if [[ $@ =~ [[:digit:]] ]]; then
        for i in $@; do
            if [[ $i -lt 1 || $i -gt 6 ]]; then
            echo "There should be numbers from 1 to 6. Please enter your parameters once again."
            exit 1
            fi
        done
        if [[ $1 -eq $2 || $3 -eq $4 ]]; then
            echo "Choose different colors for foreground and background so they don't match."
            exit 1
        else 
            ./system_info.sh "$@"
        fi
fi
# Запускаем скрипт для вывода информации о системе с заданными цветами
./system_info.sh "$@"
