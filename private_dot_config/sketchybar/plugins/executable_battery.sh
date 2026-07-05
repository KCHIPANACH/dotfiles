#!/usr/bin/env bash
INFO="$(pmset -g batt)"
# Mac mini (sin bateria) -> ocultar
if ! echo "$INFO" | grep -q "InternalBattery"; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi
PERCENT="$(echo "$INFO" | grep -Eo '[0-9]+%' | head -1 | tr -d '%')"
[ -z "$PERCENT" ] && exit 0
sketchybar --set "$NAME" drawing=on label="${PERCENT}%"
