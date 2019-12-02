wall="$(find $HOME/Pictures/ | shuf -n1)"
echo "$wall" > $HOME/Script/pywal/wal-color
wal -i $wall && $HOME/.config/bspwm/colors
