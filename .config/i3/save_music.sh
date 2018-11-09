dest="$HOME/music_list.txt"
song=$($HOME/.config/player_controller/player_control.py title)
artist=$($HOME/.config/player_controller/player_control.py artist)
out="[\""$song"\", \""$artist"\"]"
echo "$out added !"
echo $out >> $dest
awk '!a[$0]++' $dest > $dest"_"
cp $dest"_" $dest
rm $dest"_"
notify-send "Music saved !" "Music successfully saved in ~/music_list.txt !"
