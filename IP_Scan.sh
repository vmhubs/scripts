#!/bin/bash
#Scanning network segment
for ip in `seq 1 180`
do
    ping -c 1 10.12.14.$ip > /dev/null
    if [ $? -eq 0 ];then
        echo "$HOSTNAME 10.12.14.$ip UP"
    else
        echo 10.12.14.$ip DOWN
     fi

done
