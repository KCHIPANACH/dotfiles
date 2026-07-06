#!/usr/bin/env bash
# Abre una VENTANA NUEVA de Chrome (aunque ya este abierto) y la enfoca.
# Si Chrome esta cerrado, 'make new window' lo lanza igual.
osascript -e 'tell application "Google Chrome"
  make new window
  activate
end tell'
