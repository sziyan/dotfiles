#!/usr/bin/env bash
RUNNING=$(osascript -e 'if application "Spotify" is running then return 0')
if [ "$RUNNING" == "" ]; then
  RUNNING=1
fi
PLAYING=1
TRACK=""
ALBUM=""
ARTIST=""
if [ "$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')" == "playing" ]; then
  PLAYING=0
  TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
  ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
  ALBUM=$(osascript -e 'tell application "Spotify" to get album of current track')
fi

[ "${#TRACK}" -gt 10 ] && TRACK="$(echo $TRACK | head -c 15)…"
[ "${#ARTIST}" -gt 10 ] && ARTIST="$(echo $ARTIST | head -c 10)…"

if [ $RUNNING -eq 0 ] && [ $PLAYING -eq 0 ]; then
  if [ "$ARTIST" == "" ]; then
    sketchybar --set $NAME label=" $TRACK  $ALBUM " \
    background.drawing=on
  else
    sketchybar --set $NAME label=" $TRACK  $ARTIST " \
    background.drawing=on
  fi
else
  sketchybar --set $NAME label="" \
  background.drawing=off
fi
