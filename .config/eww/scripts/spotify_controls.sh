#!/bin/bash
# Utilities to retrive easily processable data 
# from spotify-tui. Also my first time really using sed and it shows.
# Writing this I kinda realize that it's not necessary. But hey, good opportunity
# for me to get used to typing in dvorak.

get_song() {
  song=`playerctl metadata title 2>&1 | sed '/^No player.*/d'`
  echo "$song"
}

get_artist() {
  artist=`playerctl metadata artist 2>&1 | sed '/^No player.*/d'`
  echo "$artist"
}

get_info() {
  song_info=`playerctl metadata -f  '{{ title }} - {{ artist }}' 2>&1 | sed '/^No player.*/d'`
  echo "$song_info"
}

get_playback_status() {
  song_info=`playerctl status 2>&1 | sed '/^No player.*/d'`
  echo "$song_info"
}

next_song() {
  playerctl next > /dev/null 2>&1 &
}


previous_song() {
  playerctl previous > /dev/null 2>&1 &
}

pause_song() {
  playerctl play-pause > /dev/null 2>&1 &
}

album_art() {
  art=`playerctl --player=spotifyd metadata mpris:artUrl 2>&1 | sed '/^No player.*/d'`
  echo "$art"
}

if [ "$1" == "song" ];then
  get_song
elif [ "$1" == "artist" ];then
  get_artist
elif [ "$1" == "format" ];then
  get_info
elif [ "$1" == "status" ];then
  get_playback_status
elif [ "$1" == "next" ];then
  next_song
elif [ "$1" == "previous" ];then
  previous_song
elif [ "$1" == "toggle" ];then
  pause_song
elif [ "$1" == "cover" ];then
  album_art
else
  echo "[ERROR] No/Invalid Paramters specified"
fi



