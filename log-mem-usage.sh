#!/bin/bash

while true
do
    free -m | grep Mem >> /home/mama/.tmp/log/mem-usage.log
    sleep 3
done
