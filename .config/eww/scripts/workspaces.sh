#!/bin/sh

workspaces (){
    WORKSPACE_FOCUSED=$(hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id') 
    WORKSPACE_WINDOWS=$(hyprctl workspaces -j | jq 'map({key: .id | tostring, value: .windows}) | from_entries')
    seq 1 10 | jq --arg focused_id "$WORKSPACE_FOCUSED" --argjson windows "${WORKSPACE_WINDOWS}" --slurp -Mc 'map(tostring) | map({id: ., windows: ($windows[.]//0), focused: (. == $focused_id)})'
}

workspaces
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  workspaces
done
