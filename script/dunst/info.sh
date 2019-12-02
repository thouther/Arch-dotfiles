#!/usr/bin/env bash

# What it look like:
# OS           Arch 5.3.1
# Date         Sep 9
# Time         16:25:34
# Uptime       2hrs
# Battery      98%
# Pacman       32/1328
# Home         10G / 20G
# Root         10g / 20G
# 

function get_OS {
    uname -r| sed 's/-.*//g'| awk '{printf "%-9s %s %s","OS","Arch",$1}'
}

function get_date {
    date -R | awk '{printf "%s %8s %s\n%s %13s","Date",$3,$2,"Time",$5}'
}

function get_uptime {
    uptime -p |awk '{printf "%-9s %sd %sh %sm","Uptime",$2,$4,$6}'
}

function get_battery {
    cat /sys/class/power_supply/BAT0/capacity | awk '{printf "%-9s %s %s","Battery","ﯓ",$1}'
}

function get_update {
    total=$(pacman -Q|wc -l)
    cat /home/$USER/updates.txt | awk -v t="$total" '{printf "%-9s  %s/%s","Pacman",$1,t}'
}

function get_homedisk {
    df -h /dev/nvme0n1p12 | sed -n 2p | awk '{printf "%-9s  %s/%s","Home",$4,$2}'
}

function get_rootdisk {
    df -h /dev/nvme0n1p11 | sed -n 2p | awk '{printf "%-9s  %s/%s","Root",$4,$2}'
}

function send_notification {
  linux=$(get_OS)
  date=$(get_date)
  uptime=$(get_uptime)
  battery=$(get_battery)
  update=$(get_update)
  homedisk=$(get_homedisk)
  rootdisk=$(get_rootdisk)
  chen=/home/$USER/Pictures/Memes/chen_info.png
  dunstify -i "$chen" "$(printf "%s\n" "$linux" "$date" "$uptime" "$battery" "$update" "$homedisk" "$rootdisk")"
}

send_notification
