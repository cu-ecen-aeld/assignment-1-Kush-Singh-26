#!/bin/bash

if [[ -z "$1" || -z "$2" ]]; then
    echo "error: 2 args required"
    echo "Usage : $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

if [[ ! -d "$filesdir" ]]; then
    echo "error: '$filesdir' is not a directory"
    exit 1
fi

file_count=$(find "$filesdir" -type f | wc -l)

matching_lines_count=$(grep -rF "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are ${file_count} and the number of matching lines are ${matching_lines_count}"