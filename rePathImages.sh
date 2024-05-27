#!/bin/bash

# Set the directory to search
DIRECTORY=$1

if [ -z "$DIRECTORY" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Find and replace text in files
find "$DIRECTORY" -type f -print0 | xargs -0 sed -i 's/_merged_assets\/_static/static/g'
