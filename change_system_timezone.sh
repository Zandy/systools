#! /bin/bash

mv /etc/localtime /etc/localtime.bak     
ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
