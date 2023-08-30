#!/bin/bash

function check_input() {
    local input="$1"

    if [[ "$input" =~ ^[0-9]+$ ]]; then
        exit 0
    else
        exit 1
    fi
}

check_input "$@"
