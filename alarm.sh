#!/bin/bash

# A simple alarm clock script

echo "What time should the alarm go off? (HH:MM)"
read target


# convert wakeup time to seconds
target_h=`echo $target | awk -F: '{print $1}'`
target_m=`echo $target | awk -F: '{print $2}'`
target_s_t=`dc -e "$target_h 60 60 ** $target_m 60 *+p"`

clock_h="12"
clock_m="00"

while test "$clock_h:$clock_m" != "$target_h:$target_m"
  do
  echo "The alarm will go off at $target_h:$target_m."
  clock=`date "+%a %b %d %T" | awk '{print $4}'`
  clock_h=`echo $clock | awk -F: '{print $1}'`
  clock_m=`echo $clock | awk -F: '{print $2}'`
  echo "It is now $clock_h:$clock_m"
  sleep 15
  clear
done

echo -e "\nWake up!"
./buzzer.sh &
bpid=$!
disown $bpid                          # eliminates termination message
