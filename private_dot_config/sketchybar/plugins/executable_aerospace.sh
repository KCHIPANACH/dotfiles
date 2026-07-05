#!/usr/bin/env bash
# Resalta el workspace activo y muestra los iconos de las apps que tiene.
source "$HOME/.config/sketchybar/plugins/icon_map.sh"
AERO="/opt/homebrew/bin/aerospace"
sid="${NAME#space.}"
[ -z "$FOCUSED_WORKSPACE" ] && FOCUSED_WORKSPACE="$($AERO list-workspaces --focused 2>/dev/null)"

strip=""
while IFS= read -r app; do
  [ -z "$app" ] && continue
  __icon_map "$app"
  strip+="${icon_result} "
done < <("$AERO" list-windows --workspace "$sid" --format '%{app-name}' 2>/dev/null)

if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" background.drawing=on background.color=0xfff5e0dc \
                           icon.color=0xff1e1e2e label.color=0xff1e1e2e label="$strip"
elif [ -n "$strip" ]; then
  sketchybar --set "$NAME" background.drawing=on background.color=0xff313244 \
                           icon.color=0xffcdd6f4 label.color=0xffcdd6f4 label="$strip"
else
  sketchybar --set "$NAME" background.drawing=off icon.color=0xffcdd6f4 label=""
fi
