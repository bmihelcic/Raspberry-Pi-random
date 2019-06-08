#!/bin/bash
echo "This is a temperature monitor script. Enter how long do you want to map temperatures."
read -p "Enter time in minutes: " TOTAL_TIME
GET_TEMP="/opt/vc/bin/vcgencmd measure_temp"
echo "Beginning temperature tracking..."
while [ $TOTAL_TIME -ne 0 ]
do 
    $GET_TEMP | cut -c 6-9 >> temps.csv
    sleep 60
    ((TOTAL_TIME--))
    echo "Minutes left:" $TOTAL_TIME
done
