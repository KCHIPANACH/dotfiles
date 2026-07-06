#!/usr/bin/env bash
# TOGGLE de la ayuda visual (capa Ventanas), estilo Spotlight:
#   - si NO esta abierta -> la abre (panel flotante)
#   - si YA esta abierta -> la cierra (no abre otra)
# Tambien se cierra con Esc o Cmd+W desde la ventana.
HTML="$HOME/.config/aerospace/cheatsheet/ventanas.html"
AERO=/opt/homebrew/bin/aerospace

# Buscar TODAS las ventanas cuyo titulo tenga "Capa Ventanas"
ids=$("$AERO" list-windows --all 2>/dev/null | grep -i "Capa Ventanas" | awk -F'|' '{gsub(/[^0-9]/,"",$1); print $1}')

if [ -n "$ids" ]; then
  # Ya abierta -> cerrar todas las que haya (limpia acumuladas)
  for id in $ids; do
    "$AERO" close --window-id "$id" 2>/dev/null
  done
else
  # No abierta -> abrir una sola, en modo app (sin barras)
  open -na "Google Chrome" --args \
    --app="file://$HTML" \
    --window-size=1000,680
fi
