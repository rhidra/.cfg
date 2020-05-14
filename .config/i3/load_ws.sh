#!/bin/sh

# Load workspace configuration
# i3-msg "workspace 6; append_layout $HOME/.config/i3/ws/ws-3_music.json"
i3-msg "workspace 3; append_layout $HOME/.config/i3/ws/ws-4_music_slack.json"

# Start applications
#urxvt -name "mocp" -e mocp &
#urxvt -name "lyvi" -e bash -c "python3 $HOME/rice/lyvi/lyvi.py" &
#urxvt -e cava &
urxvt -e ~/rice/cava/cava &

i3-msg 'workspace 0'
