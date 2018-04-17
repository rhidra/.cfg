#!/bin/bash

limit=70

song=$(mpc -f "%title%" current)
artist=$(mpc -f "%artist%" current)
if [ -z "$song" ]; then
  # Si le nom de la chanson n'est pas défini
  name=$(mpc -f "%file%" current)
  #if [ ${#name} -gt $limit ]; then
    #start=$((${#name}-limit-4))
    #end=$((${#name}-start-4))
    #name=${name:$start:$end}
     #name="$start to $end for ${#name}"
  #fi
elif [ -z "$artist" ]; then
  # Si le nom de l'artiste n'est pas défini,
  # mais celui de la chanson oui
  name=$song
else
  name="$artist - $song"
fi

name="$name  $(mpc -f "" status | grep -P "\\(.*\)" -o)"
state=$(mpc -f "" status | grep -P "\[.*]" -o)

if [ $state = "[playing]" ]; then
  echo "  $name"
elif [ $state = "[paused]" ]; then
  echo "  $name"
else
  echo ""
fi
