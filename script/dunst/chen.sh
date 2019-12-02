#!/usr/bin/env bash

function get_time {
  date -R | awk '{print $5}'
}

function chen_clock {
  chen=/home/$USER/Pictures/Memes/chen_clock.jpg
  time=$(get_time)
  dunstify -i "$chen" -u low "$(printf "%s\n %-5s" "HONK HONK!" "$time")"
}

chen_clock
