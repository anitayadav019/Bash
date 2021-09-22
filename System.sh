#!/bin/bash

echo -e "-------------------------------System Information----------------------------"
echo -e `hostname`
echo -e `hostname -I`
echo -e `ifconfig -a |awk '/^[a-z]/ { iface=$1; mac=$NF; next } /inet addr:/ { print iface, mac }'`
echo -e `lsb_release -a | grep "Description" |cut  -d ' '  -f 1 | cut -b 14,15,16,17,18,19`
echo -e `lsb_release -a | grep "Description" | cut  -d ' '  -f 3`
echo -e `free | awk '/Mem/{printf("%.2f%"), $3/$2*100}'`
echo -e `uptime | awk '{print $3,$4}' | sed 's/,//'`
echo -e `tune2fs -l /dev/sda1 | grep created`
echo -e `cat /sys/class/dmi/id/product_name`
echo -e `grep -P '^core id\t' /proc/cpuinfo | sort -u | wc -l`
echo -e `cat /sys/class/dmi/id/chassis_vendor`
echo -e `cat /sys/class/dmi/id/product_serial`
echo -e `uname -r`
echo -e `awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`