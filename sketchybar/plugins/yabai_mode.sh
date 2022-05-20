yabai_mode=$(yabai -m query --spaces --display | jq -r 'map(select(."has-focus" == true))[-1].type')

case "$yabai_mode" in
    bsp)
    sketchybar --set yabai_mode icon=""
    ;;
    stack)
    sketchybar --set yabai_mode icon="﯅"
    ;;
    float)
    sketchybar --set yabai_mode icon=""
    ;;
esac