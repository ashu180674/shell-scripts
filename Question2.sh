#!/bin/bash


if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

directory="$1"

find "$directory" -type f | awk -F. 'NF>1 {print $NF}' | sort | uniq -c | sort -k1 -n
