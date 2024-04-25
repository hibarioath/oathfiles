#!/bin/sh

updates=$(flatpak update 2>/dev/null | tail -n +5 | grep -Ecv "^$|^Proceed|^Nothing")

if [ "$updates" -gt 0 ]; then
    echo "f $updates"
else
    echo ""
fi
