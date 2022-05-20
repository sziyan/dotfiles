#!/usr/bin/env bash
#sketchybar --set ${NAME} label="${INFO}"

# W I N D O W  T I T L E 
WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.title')
app=$(yabai -m query --windows --window | jq -r '.app')

# if [[ $WINDOW_TITLE = "" ]]; then
#   WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.app')
# fi

label="${app} - ${WINDOW_TITLE}"
if [[ ${#label} -gt 30 ]]; then
  label=$(echo "$label" | cut -c 1-30)
  sketchybar --set ${NAME} label="$label"…
  exit 0
fi

sketchybar --set ${NAME} label="$label"