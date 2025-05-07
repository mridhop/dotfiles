#!/bin/bash

DEVICE="asup1205:00-093a:2008-touchpad"
CONFIG="$HOME/.config/hypr/scripts/touchpad-enabled"
[[ -f "$CONFIG" ]] || touch "$CONFIG"

ENABLED="$(cat "$CONFIG")"
RETVAL="notok"

if [[ "$ENABLED" == true ]]; then
    RETVAL="$(hyprctl -r -- keyword device[${DEVICE}]:enabled 0)"
    if [[ "$RETVAL" != "ok" ]]; then
        exit 1
    else
        echo "false" >"$CONFIG"
        notify-send Touchpad Disabled
    fi
else
    RETVAL="$(hyprctl -r -- keyword device[${DEVICE}]:enabled 1)"
    if [[ "$RETVAL" != "ok" ]]; then
        exit 1
    else
        echo "true" >"$CONFIG"
        notify-send Touchpad Enabled
    fi
fi

exit 0
