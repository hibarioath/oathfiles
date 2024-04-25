#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "<3 $(playerctl metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo "</3 $(playerctl metadata title)"
else
    echo "las voces"
fi
