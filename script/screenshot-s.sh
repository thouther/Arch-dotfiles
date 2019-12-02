#!/usr/bin/env bash
 maim --noopengl -s $HOME/Pictures/Screenshot/`date -R |awk '{printf "%s-%s-%s-%s",$2,$3,$4,$5}'|sed "s/://g"`.png 
