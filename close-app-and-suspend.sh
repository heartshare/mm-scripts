#!/bin/bash
# Requirements: wmctrl
# Usage: close-app-and-suspend application minutes

sleep "$2"m

vlcpid="$(wmctrl -l -p | grep -i -e "$1" | awk '{print ($3)}')"
kill "$vlcpid"

sleep 5s

dbus-send --system --print-reply \
    --dest="org.freedesktop.UPower" \
    /org/freedesktop/UPower \
    org.freedesktop.UPower.Suspend

exit 0
