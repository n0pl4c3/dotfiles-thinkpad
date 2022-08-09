#!/bin/sh

# Technically speaking, these are all race conds
# Practically speaking, I'm not clicking on widgets that fast

spotify() {
  already_visible=`eww get music_visible`

  if [[ "$already_visible" == "false" ]];then
    echo "[DROPDOWN] Opening Spotify Widget..."
    eww open emibar_spotify > /dev/null
    eww update music_visible=true
  else
    echo "[DROPDOWN] Closing Spotify Widget..."
    eww close emibar_spotify > /dev/null
    eww update music_visible=false
  fi
}

if [ "$1" == "spotify" ];then
  spotify
fi
