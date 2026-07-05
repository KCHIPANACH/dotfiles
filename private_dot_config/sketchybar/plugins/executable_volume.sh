#!/usr/bin/env bash
# Scroll = subir/bajar volumen · Clic = silenciar/activar
case "$SENDER" in
  mouse.scrolled)
    CUR="$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)"
    [ -z "$CUR" ] && exit 0
    if [[ "$SCROLL_DELTA" == -* ]]; then NEW=$((CUR-6)); else NEW=$((CUR+6)); fi
    [ "$NEW" -lt 0 ] && NEW=0
    [ "$NEW" -gt 100 ] && NEW=100
    osascript -e "set volume output volume $NEW"
    VOL="$NEW" ;;
  mouse.clicked)
    MUTED="$(osascript -e 'output muted of (get volume settings)' 2>/dev/null)"
    if [ "$MUTED" = "true" ]; then
      osascript -e 'set volume without output muted'
    else
      osascript -e 'set volume with output muted'
    fi
    VOL="$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)" ;;
  volume_change)
    VOL="$INFO" ;;
  *)
    VOL="$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)" ;;
esac
[ -z "$VOL" ] && exit 0
sketchybar --set "$NAME" label="${VOL}%"
