#!/usr/bin/env bash

# Delete previous screenshot.
rm /tmp/screen.png
# Set lockscreen icon.
icon="$HOME/Pictures/Icons/frozen_jotaro.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

# Screenshot.
scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
# Launch video with full screen option. Full path is necessary.
/usr/bin/mpv --fs /home/tatsu/Programming/Scripts/lock_screen/new_za_warudo.webm
# Lock the screen. Use "-n" to play sound after screen is unlocked by chaining it.
i3lock -u -i "$tmpbg" -n; /usr/bin/mpv /home/tatsu/Programming/Scripts/lock_screen/time-resume.mp3 
