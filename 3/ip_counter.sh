#!/bin/bash

# Check if a logfile location is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <Please provide the location of logfile>"
  exit 1
fi

logfile="$1"

# Extract the First column (IP addresses), sort them, count unique occurrences, and sort in descending order
awk '{print $1}' "$logfile" |  grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort | uniq -c | sort -nr
 
