#!/bin/bash

VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

# VPN connected
if [[ $VPN != "" ]]; then
  sketchybar --set $NAME label="${VPN}"            \
  drawing=on                                      \
  icon.color=0xff1efa0e
# no VPN connected                          
else
  sketchybar --set $NAME label="" \
  drawing=off
fi