#!/bin/bash

fore_white="\033[37m"
fore_red="\033[31m"
fore_green="\033[32m"
fore_blue="\033[34m"
fore_purple="\033[35m"
fore_black="\033[30m"

back_white="\033[47m"
back_red="\033[41m"
back_green="\033[42m"
back_blue="\033[44m"
back_purple="\033[45m"
back_black="\033[40m"

colorArrayFore=('' $fore_white $fore_red $fore_green $fore_blue $fore_purple $fore_black)
colorArrayBack=('' $back_white $back_red $back_green $back_blue $back_purple $back_black)
# Параметры для цветов
bg_color="${colorArrayBack[$1]}"
font_color="${colorArrayFore[$2]}"
value_bg_color="${colorArrayBack[$3]}"
value_font_color="${colorArrayFore[$4]}"
reset_color="\e[0m"

