yabai_mode=$(yabai -m query --spaces --display | jq -r 'map(select(."has-focus" == true))[-1].type')

case "$yabai_mode" in
    bsp)
    yabai -m space --layout stack && sketchybar --set yabai_mode label="﯅"
    ;;
    stack)
    yabai -m space --layout float && sketchybar --set yabai_mode label=""
    ;;
    float)
    yabai -m space --layout bsp && sketchybar --set yabai_mode label=""
    ;;
esac