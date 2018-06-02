#!/bin/bash

state=$(playerctl status)
title=$(playerctl metadata title)
artist=$(playerctl metadata artist)
album=$(playerctl metadata album)

if [ $state = "Playing" ]; then
  echo "  $artist - $title"
elif [ $state = "Paused" ]; then
  echo "  $artist - $title"
else
  echo ""
fi
