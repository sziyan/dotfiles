#!/usr/bin/env bash

# Declaration
home_wifi="SINGTEL-0468"
check="$(nc -z 8.8.8.8 53 &> /dev/null)"

# check if connected to wifi
if [ $? -eq 0 ]; then
    status="online"
else
    status="offline"
fi

ssid="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}')"
label=""

if [ ${status} = "offline" ]; then
    label=""
    color=0xff75726e    #grey
else
    if [ ${ssid} = ${home_wifi} ]; then     # if at home, remove SSID label and only show icon
        label="HOME"
    else
        label="${ssid}"
    fi
    color=0xff00FF00 #green
fi

sketchybar --set ssid label="${label}"  \
                        icon.color="${color}"   \
                        label.padding_right=10