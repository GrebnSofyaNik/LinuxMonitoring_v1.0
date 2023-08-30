#!/bin/bash

count_folders() {
    local dir="$1"
    find "$dir" -type d 2>/dev/null | wc -l
}

get_top_folders() {
    local dir="$1"
    du -h -d 1 "$dir" 2>/dev/null | sort -rh | head -n 5
}

count_files() {
    local dir="$1"
    find "$dir" -type f 2>/dev/null | wc -l
}

count_config_files() {
    local dir="$1"
    find "$dir" -type f -name "*.conf" 2>/dev/null | wc -l
}

count_text_files() {
    local dir="$1"
    find "$dir" -type f -name "*.txt" 2>/dev/null | wc -l
}

count_executable_files() {
    local dir="$1"
    find "$dir" -type f -executable 2>/dev/null | wc -l
}

count_log_files() {
    local dir="$1"
    find "$dir" -type f -name "*.log" 2>/dev/null | wc -l
}

count_archive_files() {
    local dir="$1"
    find "$dir" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" -o -name "*.tar.gz" -o -name "*.tgz" \) 2>/dev/null | wc -l
}

count_symbolic_links() {
    local dir="$1"
    find "$dir" -type l 2>/dev/null | wc -l
}

get_top_files() {
    local dir="$1"
    find "$dir" -type f -exec du -h {} + 2>/dev/null | awk '{print $1, " ", $2}' | sort -rh | head -n 10
}

get_top_executable_files() {
    local dir="$1"
    find "$dir" -type f -executable -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 | while read -r line; do
        file_path=$(echo "$line" | awk '{print $2}')
        file_size=$(echo "$line" | awk '{print $1}')
        md5_hash=$(md5sum "$file_path" | awk '{print $1}')
        echo "$file_path, $file_size, $md5_hash"
    done
}
