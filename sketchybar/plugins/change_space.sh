#!/usr/bin/env bash

inputValue=$1

case "$1" in
    home)
    skhd -k 'alt - 1'
    ;;
    study)
    skhd -k 'alt - 2'
    ;;
    news)
    skhd -k 'alt - 3'
    ;;
    love)
    skhd -k 'alt - 3'
    ;;
    extra)
    skhd -k 'alt - 4'
    ;;
esac