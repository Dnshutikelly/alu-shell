#!/usr/bin/env bash
# This script parses the Apache log file and groups visitors by IP and HTTP status code.

awk '{print $1, $9}' apache-access.log | sort | uniq -c | sort -nr
