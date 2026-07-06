#!/usr/bin/env bash
# Resalta el workspace de CADA monitor por separado y muestra iconos de apps.
#  - FOCUSED  (donde tenes el foco ahora)      -> rosewater (fuerte)
#  - VISIBLE  (el que se ve en el otro monitor) -> mauve
#  - con ventanas pero oculto                   -> pill gris
#  - vacio                                      -> solo el numero, atenuado
source "$HOME/.config/sketchybar/plugins/icon_map.sh"
AERO="/opt/homebrew/bin/aerospace"
sid="${NAME#space.}"

FOCUSED="$($AERO list-workspaces --focused 2>/dev/null)"
VISIBLE="$($AERO list-workspaces --visible 2>/dev/null)"   # uno por monitor

# Tira de iconos de las apps del workspace
strip=""
while IFS= read -r app; do
  [ -z "$app" ] && continue
  __icon_map "$app"
  strip+="${icon_result} "
done < <("$AERO" list-windows --workspace "$sid" --format '%{app-name}' 2>/dev/null)

# Es visible en algun monitor?
is_visible=0
while IFS= read -r w; do [ "$w" = "$sid" ] && is_visible=1; done <<< "$VISIBLE"

if [ "$sid" = "$FOCUSED" ]; then
  # Workspace activo (foco real) -> rosewater
  sketchybar --set "$NAME" background.drawing=on background.color=0xfff5e0dc \
                           icon.color=0xff1e1e2e label.color=0xff1e1e2e label="$strip"
elif [ "$is_visible" = "1" ]; then
  # Visible en el otro monitor -> mauve
  sketchybar --set "$NAME" background.drawing=on background.color=0xffcba6f7 \
                           icon.color=0xff1e1e2e label.color=0xff1e1e2e label="$strip"
elif [ -n "$strip" ]; then
  # Tiene ventanas pero no se ve -> pill gris
  sketchybar --set "$NAME" background.drawing=on background.color=0xff313244 \
                           icon.color=0xffcdd6f4 label.color=0xffcdd6f4 label="$strip"
else
  # Vacio -> solo el numero, atenuado
  sketchybar --set "$NAME" background.drawing=off icon.color=0xff6c7086 label=""
fi
