#!/bin/bash

limit=70

song=$(mocp -Q "%song")
artist=$(mocp -Q "%artist")
if [ -z "$song" ]; then
  name=$(mocp -Q "%file")
  name=${name#'/media/files/Musique/'}
  if [ ${#name} -gt $limit ]; then
    start=$((${#name}-limit-4))
    end=$((${#name}-start-4))
    name=${name:$start:$end}
    #name="$start to $end for ${#name}"
  fi
elif [ -z "$artist" ]; then
  name=$song
else
  name="$artist - $song"
fi

name="$name  |  $(mocp -Q "%ct / %tl")"
state=$(mocp -Q "%state")

if [ $state = "PLAY" ]; then
  echo "  $name"
elif [ $state = "PAUSE" ]; then
  echo "  $name"
else
  echo ""
fi
