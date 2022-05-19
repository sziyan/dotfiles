#!/usr/bin/env bash
check_float=$(yabai -m query --windows --window | jq '."is-floating"')

case $check_float in
    false)
    sketchybar -m --set yabai_float label=""
    ;;
    true)
    sketchybar -m --set yabai_float label=""
    ;;
esac

