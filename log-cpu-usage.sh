#!/bin/bash

while true
do
    ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10 >> /home/mama/.tmp/log/cpu-usage.log
    echo >> /tmp/cpu-usage.log
    sleep 1
done
