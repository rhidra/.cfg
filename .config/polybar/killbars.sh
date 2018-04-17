#!/usr/bin/env sh
# Supprime toutes les instances de polybar fonctionnant
# Utile pour débugguer lors de tests de configuration

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "Bar killed !"
