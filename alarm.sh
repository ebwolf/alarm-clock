#!/bin/bash

# A simple alarm clock script

echo "What time should the alarm go off? (HH:MM)"
read target


# convert wakeup time to seconds
targetHour=`echo $target | awk -F: '{print $1}'`
targetMinute=`echo $target | awk -F: '{print $2}'`

clockHour="12"
clockMinute="00"

while test "$clockHour:$clockMinute" != "$targetHour:$targetMinute"
  do
  echo "The alarm will go off at $targetHour:$targetMinute."
  clockCMD=`date "+%a %b %d %T" | awk '{print $4}'`
  clockHour=`echo $clockCMD | awk -F: '{print $1}'`
  clockMinute=`echo $clockCMD | awk -F: '{print $2}'`
  echo "It is now $clockHour:$clockMinute"
  sleep 15
  clear
done

echo -e "\nWake up!"
./buzzer.sh &
bpid=$!
disown $bpid                          # eliminates termination message
