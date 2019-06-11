#!/bin/bash

rm ~/temps.csv
GET_TEMP="/opt/vc/bin/vcgencmd measure_temp"
echo "This is a temperature monitor script. Enter how long do you want to map temperatures."
read -p "Enter time in minutes: " TOTAL_TIME

echo "Temperature tracking began."
echo "See you in" $TOTAL_TIME "minutes"
while [ $TOTAL_TIME -ne 0 ]
do 
    $GET_TEMP | cut -c 6-9 | tr -d '\n' >> ~/temps.csv
    echo -n "," >> ~/temps.csv
    sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq | tr -d '\n' >> ~/temps.csv
    echo -n "," >> ~/temps.csv
    sudo cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq | tr -d '\n' >> ~/temps.csv
    echo -n "," >> ~/temps.csv
    sudo cat /sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_cur_freq | tr -d '\n' >> ~/temps.csv
    echo -n "," >> ~/temps.csv
    sudo cat /sys/devices/system/cpu/cpu3/cpufreq/cpuinfo_cur_freq >> ~/temps.csv
    sleep 60
    ((TOTAL_TIME--))
    echo "Minutes left:" $TOTAL_TIME
done
