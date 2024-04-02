#!/bin/bash

# Check if a directory has been provided
if [ -z "$1" ]; then
    echo "Please provide a directory."
    exit 1
fi

# Change to the provided directory
cd "$1" || exit

# Rename all files
find . -depth -name '*' -execdir bash -c 'mv -i "$1" "$(echo "$1" | tr "[:upper:]" "[:lower:]" | tr " " "-" | sed "s/&/and/g" | tr -s "-")"' bash {} \;

echo "Renaming completed."
