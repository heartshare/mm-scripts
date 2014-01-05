#!/bin/bash

log="/home/mama/.tmp/log/cpu-usage.log"

printf "\n%s\n============================\n" "$(date)" > "$log"
while true
do
    ps -eo pcpu,pid,user,args --sort -pcpu | head -10 >> "$log"
    echo >> "$log"
    sleep 1
done
