-- Opciones generales del editor (estilo VSCode)
local opt = vim.opt

-- Apariencia
opt.termguicolors = true     -- colores de 24 bits (necesario para los temas)
opt.number = true            -- números de línea
opt.relativenumber = false   -- VSCode usa numeración absoluta por defecto
opt.cursorline = true        -- resalta la línea actual
opt.signcolumn = "yes"       -- columna fija a la izquierda (git/diagnósticos)
opt.wrap = false             -- no partir líneas largas
opt.scrolloff = 8            -- margen vertical al hacer scroll
opt.sidescrolloff = 8        -- margen horizontal
opt.background = "dark"

-- Indentación
opt.expandtab = true         -- usar espacios en vez de tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true

-- Búsqueda
opt.ignorecase = true
opt.smartcase = true         -- sensible a mayúsculas solo si las escribes
opt.hlsearch = true
opt.incsearch = true

-- Comportamiento
opt.mouse = "a"              -- soporte de ratón (como VSCode)
opt.clipboard = "unnamedplus" -- usar el portapapeles del sistema
opt.splitright = true        -- los splits verticales abren a la derecha
opt.splitbelow = true        -- los splits horizontales abren abajo
opt.undofile = true          -- historial de deshacer persistente
opt.updatetime = 250         -- respuesta más rápida de eventos
opt.timeoutlen = 400
opt.completeopt = "menu,menuone,noselect"

-- Interfaz
opt.showmode = false         -- el modo lo muestra la barra de estado (lualine)
opt.laststatus = 3           -- una sola barra de estado global
opt.title = true
