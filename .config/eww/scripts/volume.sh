#!/bin/bash

get_volume() {
  pulsemixer --get-volume | awk '{print $1;}'
}

set_volume() {
  volume=`echo "$1" | awk -F. '{print $1}'`
  echo $volume
  pulsemixer --set-volume $volume
}

if [ "$1" == "get" ];then
  get_volume
elif [ "$1" == "set" ];then
  set_volume "$2"
else
  echo "[ERROR] No/Invalid Paramters specified"
fi



