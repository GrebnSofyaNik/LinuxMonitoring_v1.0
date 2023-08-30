#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <text>"
    exit 1
fi

input="$1"

if ./input_checker.sh "$input"; then
    echo "Invalid input: Please provide a text parameter, not a number."
else
    ./text_processor.sh "$input"
fi
