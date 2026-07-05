-- Bootstrap del gestor de plugins lazy.nvim
-- Se instala automáticamente la primera vez que abres Neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Error al clonar lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Carga todas las especificaciones de plugins desde lua/plugins/
require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "vscode" } },
  checker = { enabled = true, notify = false }, -- avisa de actualizaciones en segundo plano
})
