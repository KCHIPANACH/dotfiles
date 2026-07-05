-- neo-tree: explorador de archivos en barra lateral (estilo VSCode)
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- iconos de archivos
    "MunifTanjim/nui.nvim",
  },
  -- Abre el explorador automáticamente al iniciar
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Solo si no se abrió Neovim con un archivo concreto
        if vim.fn.argc() == 0 then
          require("neo-tree.command").execute({ action = "show", source = "filesystem" })
        end
      end,
    })
  end,
  opts = {
    close_if_last_window = true, -- cierra Neovim si solo queda el explorador
    enable_git_status = true,
    enable_diagnostics = true,
    popup_border_style = "rounded",
    window = {
      position = "left",
      width = 32,
      mappings = {
        ["<space>"] = "none", -- liberar el leader dentro del árbol
        ["<cr>"] = "open",
        ["o"] = "open",
        ["P"] = { "toggle_preview", config = { use_float = true } },
      },
    },
    filesystem = {
      follow_current_file = { enabled = true }, -- resalta el archivo abierto
      use_libuv_file_watcher = true,            -- refresca al cambiar archivos
      filtered_items = {
        visible = false,
        hide_dotfiles = false,  -- mostrar archivos ocultos (.env, etc.)
        hide_gitignored = true,
      },
    },
    default_component_configs = {
      indent = { with_markers = true, with_expanders = true },
      git_status = {
        symbols = {
          added = "✚", modified = "", deleted = "✖", renamed = "󰁕",
          untracked = "", ignored = "", unstaged = "󰄱", staged = "", conflict = "",
        },
      },
    },
  },
}
