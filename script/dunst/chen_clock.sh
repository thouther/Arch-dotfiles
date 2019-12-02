#!/usr/bin/env bash
SHELL=/bin/sh
#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/thouther/Script
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


Dun=`pidof dunst`
if [[ -n "$Dun" ]]; then
  pkill dunst && dunst -config /home/$USER/.config/dunst/dunstrc-clock &
  sh /home/thouther/Script/dunst/chen.sh
else
  dunst -config /home/$USER/.config/dunst/dunstrc-clock &
  sh /home/thouther/Script/dunst/chen.sh
fi

sleep 5
pkill dunst && dunst &
