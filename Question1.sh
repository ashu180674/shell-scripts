#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: No log file provided."
  exit 1
fi

LOG_FILE="$1"

if [ ! -r "$LOG_FILE" ]; then
  echo "Error: Log file does not exist or is not readable."
  exit 1
fi

#total requests
total_requests=$(wc -l < "$LOG_FILE")

#percentage of successful requests
successful_requests=$(grep -E '" 2[0-9]{2} ' "$LOG_FILE" | wc -l)
percentage_successful=$(($successful_requests*100/$total_requests))

#most active user (IP_address)
most_active_user=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

#output
echo "Total Requests Count: $total_requests"
echo "Percentage of Successful Requests: $percentage_successful%"
echo "Most Active User: $most_active_user"
