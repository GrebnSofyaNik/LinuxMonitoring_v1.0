#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Error: '$directory' is not a valid directory."
    exit 1
fi

start_time=$(date +%s)

source file_operations.sh
source print_info.sh

total_folders=$(count_folders "$directory")
top_folders=$(get_top_folders "$directory")
total_files=$(count_files "$directory")
config_files=$(count_config_files "$directory")
text_files=$(count_text_files "$directory")
executable_files=$(count_executable_files "$directory")
log_files=$(count_log_files "$directory")
archive_files=$(count_archive_files "$directory")
symbolic_links=$(count_symbolic_links "$directory")
top_files=$(get_top_files "$directory")
top_executable_files=$(get_top_executable_files "$directory")

end_time=$(date +%s)
execution_time=$(echo "$end_time - $start_time" | bc -l)

print_info "$total_folders" "$top_folders" "$total_files" "$config_files" "$text_files" "$executable_files" "$log_files" "$archive_files" "$symbolic_links" "$top_files" "$top_executable_files" "$execution_time"
