#!/usr/bin/env bash
# Métricas para la barra de tmux: CPU · RAM · disco.
# Salida con formato de color de tmux (#[fg=...]). Pensado para correr cada
# pocos segundos (status-interval). Liviano y read-only.

# ── CPU % (100 - idle) ─────────────────────────────────────────
cpu=$(top -l 1 -n 0 2>/dev/null | awk -F',' '
  /CPU usage/ {
    for (i=1;i<=NF;i++) if ($i ~ /idle/) { gsub(/[^0-9.]/,"",$i); printf "%.0f", 100-$i }
  }')
[ -z "$cpu" ] && cpu=0

# ── RAM usada / total (GB) ─────────────────────────────────────
mem_used=$(vm_stat 2>/dev/null | awk '
  /^Pages active:/                 {gsub(/\./,"",$NF); a=$NF}
  /^Pages wired down:/             {gsub(/\./,"",$NF); w=$NF}
  /^Pages occupied by compressor:/ {gsub(/\./,"",$NF); c=$NF}
  END {printf "%.1f", (a+w+c)*16384/1024/1024/1024}')
mem_total=$(sysctl -n hw.memsize 2>/dev/null | awk '{printf "%.0f", $1/1073741824}')
mem_pct=$(awk "BEGIN{printf \"%d\", $mem_used/$mem_total*100}")

# ── Disco raíz (% usado) ───────────────────────────────────────
disk=$(df -H / 2>/dev/null | awk 'NR==2 {gsub(/%/,"",$5); print $5}')
[ -z "$disk" ] && disk=0

# ── Colores Catppuccin según umbral ────────────────────────────
col() {  # $1=valor  → verde / amarillo / rojo
  if   [ "$1" -ge 85 ]; then printf '#f38ba8'      # rojo
  elif [ "$1" -ge 60 ]; then printf '#f9e2af'      # amarillo
  else printf '#a6e3a1'; fi                         # verde
}

printf '#[fg=%s]CPU %s%%#[fg=#6c7086] · #[fg=%s]RAM %s/%sG#[fg=#6c7086] · #[fg=%s]DISK %s%%#[default]' \
  "$(col "$cpu")"     "$cpu" \
  "$(col "$mem_pct")" "$mem_used" "$mem_total" \
  "$(col "$disk")"    "$disk"
