#!/bin/bash

limit=70

song=$(mocp -Q "%song")
artist=$(mocp -Q "%artist")
if [ -z "$song" ]; then
  name=$(mocp -Q "%file")
  name=${name#'/media/files/Musique/'}
  if [ ${#name} -gt $limit ]; then
    name=${name:$limit-${#name}:$limit}
  fi
elif [ -z "$artist" ]; then
  name=$song
else
  name="$song - $artist"
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
