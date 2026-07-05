#!/usr/bin/env bash
# Fecha en español (capitalizada, sin puntos) + hora
D="$(LC_TIME=es_ES.UTF-8 date '+%a %d %b' | tr -d '.' | awk '{for(i=1;i<=NF;i++)$i=toupper(substr($i,1,1)) substr($i,2)}1')"
T="$(date '+%H:%M')"
sketchybar --set "$NAME" label="${D}  ${T}"
