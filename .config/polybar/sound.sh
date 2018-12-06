#!/bin/bash

limit=15

# level=$(/usr/share/i3blocks/volume 5 pulse)
level=$(amixer -c 0 -M -D pulse get Master | ruby -ne '$_ =~ /\[(\d+)%\] \[(on|off)\]/ and (puts $2 == "off" ? "MUTE" : "#$1%"; exit)')
level=${level:0:${#level}-1}

if [[ "$level" =~ "MUT" ]]; then
  echo ""
elif [ $level -lt $limit ]; then
  echo " $level"
else
  echo " $level"
fi
