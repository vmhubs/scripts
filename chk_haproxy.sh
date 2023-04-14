#!/bin/bash
#**********************************************************************************************
#Author:       David.Hu
#Date:         2022-12-26
#FileName:     /etc/keepalived/chk_haproxy.sh
#Description:   Check the Harpoxy status script
#Copyright (C): 2022 All rights reserved
#*********************************************************************************************
err=0
for k in $(seq 1 3);do
        check_code=$(pgrep haproxy)
        if test[ $check_code == "" ]; then
                err=$(expr $err + 1)
                sleep 1
                continue
        else
                err=0
                break
        fi
done

if test[ $err != "0" ]; then
        echo "systemctl stop keepalived"
        /usr/bin/systemctl stop keepalived
        exit 1
else
        exit 0
fi

