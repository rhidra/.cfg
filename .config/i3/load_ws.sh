#!/bin/sh

# Load workspace configuration
i3-msg "workspace 6; append_layout $HOME/.config/i3/ws/ws-3_music.json"
# i3-msg 'workspace 6; append_layout $HOME/.config/i3/ws-3_music.json'

# Start applications
urxvt -name "ncmpcpp" -e ncmpcpp &
urxvt -name "lyvi" -e bash -c "python3 $HOME/rice/lyvi/lyvi.py" &
urxvt -e cava &

i3-msg 'workspace 0'
