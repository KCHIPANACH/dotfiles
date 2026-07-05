-- Tema de color idéntico al "Dark+" de VSCode
return {
  "Mofiqul/vscode.nvim",
  lazy = false,    -- el tema debe cargarse al inicio
  priority = 1000, -- antes que el resto de plugins
  config = function()
    require("vscode").setup({
      style = "dark",       -- "dark" (Dark+) o "light"
      transparent = false,
      italic_comments = true,
      underline_links = true,
      disable_nvimtree_bg = true,
    })
    vim.cmd.colorscheme("vscode")
  end,
}
