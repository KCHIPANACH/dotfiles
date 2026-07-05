-- Punto de entrada de la configuración de Neovim
-- Estructura modular: opciones + keymaps + gestor de plugins (lazy.nvim)

-- El leader debe definirse ANTES de cargar lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.cursorline = true
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false

require("config.options")
require("config.keymaps")
require("config.lazy")
