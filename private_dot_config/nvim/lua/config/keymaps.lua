-- Atajos de teclado al estilo VSCode
local map = vim.keymap.set

-- Explorador de archivos (neo-tree)
-- Ctrl+b: abrir/cerrar la barra lateral (igual que en VSCode)
map("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Explorador: abrir/cerrar" })
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorador: abrir/cerrar" })
map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Explorador: enfocar" })

-- Navegación entre pestañas (bufferline) como Ctrl+Tab en VSCode
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Siguiente pestaña" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Pestaña anterior" })
map("n", "<leader>w", "<cmd>bdelete<cr>", { desc = "Cerrar pestaña/buffer" })

-- Guardar con Ctrl+s (como VSCode)
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Guardar archivo" })

-- Mover entre ventanas (splits) con Ctrl + flechas/hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Ir a ventana izquierda" })
map("n", "<C-j>", "<C-w>j", { desc = "Ir a ventana abajo" })
map("n", "<C-k>", "<C-w>k", { desc = "Ir a ventana arriba" })
map("n", "<C-l>", "<C-w>l", { desc = "Ir a ventana derecha" })

-- Quitar el resaltado de búsqueda con Esc
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Quitar resaltado de búsqueda" })

-- Indentar manteniendo la selección en modo visual
map("v", "<", "<gv")
map("v", ">", ">gv")
