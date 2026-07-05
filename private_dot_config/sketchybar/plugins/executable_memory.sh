#!/usr/bin/env bash
MEM="$(top -l 1 -n 0 | awk '/PhysMem/{print $2}')"
[ -z "$MEM" ] && exit 0
sketchybar --set "$NAME" label="${MEM}"
