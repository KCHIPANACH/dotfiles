-- Componentes visuales que dan el aspecto de VSCode:
-- pestañas de editor (bufferline) + barra de estado (lualine)
return {
  -- Pestañas de archivos abiertos en la parte superior
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "thin", -- pestañas planas como VSCode
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "EXPLORADOR",
            text_align = "left",
            separator = true,
          },
        },
      },
    },
  },

  -- Barra de estado inferior
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "vscode",
        globalstatus = true,           -- una sola barra para toda la ventana
        section_separators = "",       -- estilo plano
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
