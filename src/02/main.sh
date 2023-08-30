#!/bin/bash

./system_info.sh

read -p "Do you want to write the information to a file? (Y/N): " choice
case "$choice" in
    [Yy])
    ./file_writer.sh
    ;;
  *)
    echo "Exiting without writing to a file."
    ;;
esac
