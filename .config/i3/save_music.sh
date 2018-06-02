dest="$HOME/music_list.txt"
song=$(playerctl metadata title)
artist=$(playerctl metadata artist)
out=$song" - "$artist
echo "$out added !"
echo $out >> $dest
awk '!a[$0]++' $dest > $dest"_"
cp $dest"_" $dest
rm $dest"_"
notify-send "Music saved !" "Music successfully saved in ~/music_list.txt !"
