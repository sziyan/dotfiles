#!/usr/bin/env bash

STATIC_NAMES=("" "I" "II" "III" "IV" "V" "VI") #0 to 15
ICONS=("" "" "" "" "♥" "ﴥ")
args=()
QUERY="$(yabai -m query --spaces | jq -r '.[] | [.index, .windows[1], .label, .display, ."is-visible"] | @sh')"
NAMES=""
COUNT=0
# Read the current spaces from the yabai query
while read -r index window yabai_name display visible
do
  COUNT=$((COUNT+1))
  NAME="$(echo "${yabai_name}" | tr -d "'")"
  #pid="$(yabai -m query --windows --window ${window} | jq '.pid' )"
  

  # if [ "${window}" = "null" ]; then
  #   label="${NAME}"
  # elif [ "${pid}" -eq "832" ]; then
  #   label="${NAME}"
  # else
  #   label="${NAME}°"
  # fi

  if [ "$NAME" = "" ] || [ "$NAME" = " " ]; then
    NAME="${index}"
  fi

  NAMES="$NAMES $NAME"
  
  args+=(--clone "$NAME" space_template after \
         --set "$NAME" icon="${ICONS[${index}]}"
                       icon.highlight_color="0xffd1b620" \
                       associated_display=${display} \
                       icon.highlight=${visible} \
                       drawing=on)

done <<< "$QUERY"



# Reorder them and stick them onto sketchybar
args+=(--reorder $NAMES)
sketchybar -m ${args[@]} &> /dev/null



# sketchybar --add bracket primary_spaces $NAMES  \
# --set primary_spaces background.color=0xfff6c177  \
# background.border_color=0xff9ccfd8  \
# background.border_width=2
# echo $NAMES

# Get the current space count
#CURRENT_SPACE_COUNT=$(sketchybar -m --query bar | jq '.items | map(try tonumber catch 0) | max')

# If our current space count is greater than the count found by the yabai query,
# go through and remove the destroyed spaces
# while [ "${#CURRENT_SPACE_COUNT}" -gt $COUNT ]
# do
#   sketchybar -m --remove "${CURRENT_SPACE_COUNT}"
#   CURRENT_SPACE_COUNT=$((CURRENT_SPACE_COUNT-1))
# done