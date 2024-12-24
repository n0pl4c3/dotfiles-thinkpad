#!/bin/bash 

WALLPAPER=(
    "$HOME/Pictures/Wallpaper/static1.png"
    "$HOME/Pictures/Wallpaper/stealth.jpg"
    "$HOME/Pictures/Wallpaper/animated1.gif"
)

NUM_WALLPAPERS=${#WALLPAPER[@]}

set_wallpaper() {
    local wallpaper="$1"
    swww img "$wallpaper" --transition-type center
    notify-send --app-name "wallpaper-sh" "Wallpaper changed to $wallpaper"
}

STATE_FILE="$HOME/scripts/.wallpaper_state"

if [ ! -f "$STATE_FILE" ]; then
    echo "0" > "$STATE_FILE"
fi

CURRENT_STATE=$(<"$STATE_FILE")

NEXT_STATE=$(( (CURRENT_STATE + 1) % NUM_WALLPAPERS ))

set_wallpaper "${WALLPAPER[$NEXT_STATE]}"
echo "$NEXT_STATE" > "$STATE_FILE"
