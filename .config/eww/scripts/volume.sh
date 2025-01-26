#!/bin/bash

get_volume() {
  wpctl get-volume @DEFAULT_AUDIO_SINK@  | awk '{print $2*100;}'
}

get_muted() {
  wpctl get-volume @DEFAULT_AUDIO_SINK@  | awk '{print $3;}'
}

set_volume() {
  volume=`echo "$1" | awk -F. '{print $1}'`
  volume=$(awk "BEGIN {printf \"%.2f\", $volume / 100}")
  wpctl set-volume @DEFAULT_AUDIO_SINK@ $volume
}

if [ "$1" == "get" ];then
  get_volume
elif [ "$1" == "set" ];then
  set_volume "$2"
elif [ "$1" == "mute" ];then
  get_muted
else
  echo "[ERROR] No/Invalid Paramters specified"
fi



