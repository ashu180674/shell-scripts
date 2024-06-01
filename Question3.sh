#!/bin/bash


if [ -z "$1" ]; then
  echo "usage: $0 <service_name>"
  exit 1
fi

#service name to check
service_name="$1"

#check the status of the service
if systemctl is-active --quiet "$service_name"; then
  echo "The service '$service_name' is running."
else
  echo "The service '$service_name' is not running."
fi
