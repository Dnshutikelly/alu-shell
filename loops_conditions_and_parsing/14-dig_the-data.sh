#!/usr/bin/env bash
# This script groups visitors by IP and HTTP status code, displaying occurrences.

# Check if log file exists and is not empty
if [[ ! -s apache-access.log ]]; then
    echo "The log file is empty or doesn't exist."
    exit 1
fi

# Check if the log file has the correct format (contains IP addresses and HTTP codes)
if ! awk '($1 ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/ && $9 ~ /^[0-9]{3}$/)' apache-access.log > /dev/null; then
    echo "The log file is in the wrong format."
    exit 1
fi

# Process the log file
awk '{print $1, $9}' apache-access.log | sort | uniq -c | sort -nr
