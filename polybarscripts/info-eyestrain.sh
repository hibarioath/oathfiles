#!/bin/sh

time=$((20 - $(date '+%-M') % 20))

if [ $time -eq 20 ]; then
    notify-send 'Descansa maricón' &
#    ogg123 beep.ogg &> /dev/null &
fi

echo "o.o $time"
