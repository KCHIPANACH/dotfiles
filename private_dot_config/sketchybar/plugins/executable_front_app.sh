#!/usr/bin/env bash
# Icono + nombre de la app enfocada
if [ "$SENDER" = "front_app_switched" ]; then
  source "$HOME/.config/sketchybar/plugins/icon_map.sh"
  __icon_map "$INFO"
  sketchybar --set "$NAME" icon="$icon_result" label="$INFO"
fi
