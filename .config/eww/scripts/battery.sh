#!/bin/sh
bat0=/sys/class/power_supply/BAT0
bat1=/sys/class/power_supply/BAT1
charge0="$(cat "$bat0/capacity")"
charge1="$(cat "$bat1/capacity")"

charge=$(( charge0+charge1 ))
# [ $(cat "$bat0/status") = Charging ] && echo "" && exit
# [ $(cat "$bat1/status") = Charging ] && echo "" && exit

if [ "$charge" -gt "160" ];then
  echo ""
elif [ "$charge" -gt "100" ];then
  echo ""
elif [ "$charge" -gt "50" ];then
  echo ""
elif [ "$charge" -gt "20" ];then
  echo ""
else
  echo ""
fi
