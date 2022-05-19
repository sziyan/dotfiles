#!/usr/bin/env bash
ssid="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}')"

sketchybar --set ssid label="${ssid}  "