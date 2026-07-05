#!/usr/bin/env bash
# Muestra track + controla la visibilidad de los botones prev/next.
if ! pgrep -xq "Music"; then
  sketchybar --set music drawing=off --set music_prev drawing=off --set music_next drawing=off
  exit 0
fi
STATE="$(osascript -e 'tell application "Music" to player state as string' 2>/dev/null)"
if [ "$STATE" = "playing" ]; then
  TRACK="$(osascript -e 'tell application "Music" to name of current track' 2>/dev/null)"
  ARTIST="$(osascript -e 'tell application "Music" to artist of current track' 2>/dev/null)"
  LABEL="${TRACK} — ${ARTIST}"
  [ ${#LABEL} -gt 40 ] && LABEL="${LABEL:0:39}…"
  sketchybar --set music drawing=on label="$LABEL" \
             --set music_prev drawing=on --set music_next drawing=on
else
  sketchybar --set music drawing=off --set music_prev drawing=off --set music_next drawing=off
fi
