#!/usr/bin/env sh
# Démarre polybar et supprime les instances déjà démarrées
# Supporte le multi-monitoring
# Pour changer le nom de la barre à afficher, changer la variable $bar

# Name of bar in config
bar="example"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "Launching bar ..."

# Script for multiple monitor bar launching
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload $bar &
  done
else
  polybar --reload $bar &
fi

echo "Bars launched..."
