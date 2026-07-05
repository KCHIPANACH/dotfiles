# dotfiles

Configuración personal de terminal y entorno de desarrollo para **macOS** y **Linux** (Omarchy), gestionada con [chezmoi](https://chezmoi.io).

Una sola base compartida entre todas las máquinas, con ajustes por sistema operativo y por equipo. Lo específico de cada máquina y cualquier dato sensible se mantienen **fuera** del repositorio.

## Qué incluye

| Área | Herramienta / archivo |
|------|-----------------------|
| Shell | zsh + Oh My Zsh + Starship (`dot_zshrc.tmpl`, `starship.toml`) |
| Historial | Atuin (`atuin/config.toml`) |
| Multiplexor | tmux (`dot_tmux.conf`, `tmux/`) |
| Terminal | Ghostty (`ghostty/config.tmpl`) |
| Editor | Neovim (`nvim/`) y VS Code (`vscode/`) |
| Git | `dot_gitconfig`, `git/ignore` |
| macOS | sketchybar y borders (solo en macOS) |
| Paquetes | `Brewfile` (macOS), `packages-linux.txt` (Linux) |

## Requisitos

- [chezmoi](https://chezmoi.io/install/)
- macOS: [Homebrew](https://brew.sh)
- Linux (Omarchy / Arch): `pacman` (paquetes de AUR como `pyenv` y `rbenv` se instalan aparte con `yay`)

## Instalación en una máquina nueva

```bash
chezmoi init --apply https://github.com/KCHIPANACH/dotfiles.git
```

Después instala los paquetes:

```bash
# macOS
brew bundle --file="$(chezmoi source-path)/Brewfile"

# Linux (Arch / Omarchy)
sudo pacman -S --needed - < "$(chezmoi source-path)/packages-linux.txt"
```

También puedes usar `bootstrap.sh`, que instala chezmoi, los paquetes y aplica la configuración.

## Ajustes por máquina (no versionados)

Lo específico de cada equipo (rutas de proyectos, herramientas en ubicaciones propias, integraciones locales) va en `~/.zshrc.local`, que **no** se versiona. Usa la plantilla como base:

```bash
cp "$(chezmoi source-path)/zshrc.local.example" ~/.zshrc.local
```

## Teclado Corne

Los atajos de la capa de símbolos del teclado Corne en Ghostty se aplican **solo** en la Mac mini, mediante una plantilla por nombre de equipo. Las demás máquinas usan su teclado propio.

## Qué NO se incluye

Por seguridad, este repositorio **no** contiene credenciales ni datos sensibles:

- Llaves SSH (`~/.ssh`)
- Tokens de sesión de CLIs (GitHub, Google Cloud, Azure)
- Configuración de aplicaciones con secretos

Esos archivos se configuran manualmente en cada equipo.
