#!/bin/bash

function process_text() {
    local input="$1"
    local text_length=${#input}

    echo "Input text: $input"
    echo "Text length: $text_length"
}

process_text "$@"
