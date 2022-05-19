#!/bin/bash

VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

# VPN connected
if [[ $VPN != "" ]]; then
  sketchybar --set vpn icon= \
  label="${VPN}"            \
  icon.color=0xff1efa0e

# no VPN connected                          
else
  sketchybar --set vpn icon= \
  label=""            \
  icon.color=0xff797979
fi