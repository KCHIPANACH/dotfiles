#!/usr/bin/env bash
CPU="$(top -l 1 -n 0 | awk '/CPU usage/{gsub(/%/,""); printf "%.0f", $3+$5}')"
[ -z "$CPU" ] && exit 0
sketchybar --set "$NAME" label="${CPU}%"
