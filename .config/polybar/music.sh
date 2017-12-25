#!/bin/bash

name=$(mocp -Q "%song - %artist  |  %ct / %tl")
state=$(mocp -Q "%state")

if [ $state = "PLAY" ]; then
  echo "  $name"
elif [ $state = "PAUSE" ]; then
  echo "  $name"
else
  echo ""
fi
