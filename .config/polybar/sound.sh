#!/bin/bash

limit=15

level=$(/usr/share/i3blocks/volume 5 pulse)
level=${level:0:${#level}-1}

if [[ "$level" =~ "MUT" ]]; then
  echo ""
elif [ $level -lt $limit ]; then
  echo " $level"
else 
  echo " $level"
fi
