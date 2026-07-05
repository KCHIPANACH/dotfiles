#!/usr/bin/env bash
DEV="$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $2; exit}')"
[ -z "$DEV" ] && DEV="en0"
if ifconfig "$DEV" 2>/dev/null | grep -q 'status: active'; then
  sketchybar --set "$NAME" label="WiFi"
else
  sketchybar --set "$NAME" label="—"
fi
