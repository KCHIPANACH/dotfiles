#!/usr/bin/env bash
# Bootstrap de dotfiles con chezmoi (macOS + Linux/Arch).
set -euo pipefail

# 1. chezmoi
if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
fi

SRC="$(chezmoi source-path 2>/dev/null || echo "$HOME/.local/share/chezmoi")"

# 2. Paquetes
if [[ "$(uname)" == "Darwin" ]]; then
  command -v brew >/dev/null 2>&1 || \
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  [[ -f "$SRC/Brewfile" ]] && brew bundle --file="$SRC/Brewfile"
else
  if command -v pacman >/dev/null 2>&1 && [[ -f "$SRC/packages-linux.txt" ]]; then
    sudo pacman -S --needed - < "$SRC/packages-linux.txt"
  fi
fi

# 3. Aplicar dotfiles
chezmoi apply

echo "Listo. Copia ~/.zshrc.local desde zshrc.local.example si necesitas ajustes de máquina."
