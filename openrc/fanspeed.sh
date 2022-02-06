#!/bin/bash

echo "Started fanspeed daemon"

while true
do
  temp=`cat /sys/class/drm/card0/device/hwmon/hwmon1/temp1_input`

  echo "Current temperature is $temp"

  next_pwm="0"

  if [ $temp -lt 40000 ]; then
    next_pwm="0"
  elif [ $temp -lt 50000 ]; then
    next_pwm="24"
  elif [ $temp -lt 60000 ]; then
    next_pwm="48"
  elif [ $temp -lt 70000 ]; then
    next_pwm="96"
  elif [ $temp -lt 80000 ]; then
    next_pwm="128"
  fi

  echo "Next pwm is gonna be $next_pwm"

  echo "1" > /sys/class/drm/card0/device/hwmon/hwmon1/pwm1_enable
  echo $next_pwm > /sys/class/drm/card0/device/hwmon/hwmon1/pwm1

  sleep 10
done
