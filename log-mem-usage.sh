#!/bin/bash

log="/home/mama/.tmp/log/mem-usage.log"

printf "\n%s\n============================\n" "$(date)" > "$log"
while true
do
    free -m | grep Mem >> "$log"
    sleep 3
done
