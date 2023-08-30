#!/bin/bash

function write_to_file() {
    timestamp=$(date +'%d_%m_%Y_%H_%M_%S')
    filename="${timestamp}.status"

    ./system_info.sh > "$filename"
    echo "Data has been written to '$filename'."
}

write_to_file

