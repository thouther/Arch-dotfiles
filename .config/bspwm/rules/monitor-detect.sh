#!/bin/bash
intern=eDP-1
extern=DP-1

source $DOTPATH/install/variables.sh

if ask "Dual Monitor Mode?" Y; then
    ## Dual Monitors
    # xrandr --output "$intern" --off --output "$extern" --auto
    xrandr --output "$extern" --primary --output "$intern"
    #bspc desktop 0 I -m "$intern" --follow
    bspc monitor "$extern" -d 1 2 3 4 5 6 7 8 9 
    bspc monitor "$intern" -d 0
    mons -e right
    
    $HOME/Script/pywal/wal-reset.sh
    killall -q polybar
    polybar mainbar-bspwm -r &
  else
    if ask "Only Laptop?" Y; then
        ## Right Monitors
        xrandr --output "$intern" --primary
        bspc monitor "$intern" -d 1 2 3 4 5 6 7 8 9
        mons -o
        
        $HOME/Script/pywal/wal-reset.sh
        killall -q polybar
        polybar mainbar-bspwm-2 -r &
      else
        ## Left Monitors
        xrandr --output "$extern" --primary
        bspc monitor "$extern" -d 1 2 3 4 5 6 7 8 9
        mons -s
        
        $HOME/Script/pywal/wal-reset.sh
        killall -q polybar
        polybar mainbar-bspwm -r &
    fi
fi

disown
