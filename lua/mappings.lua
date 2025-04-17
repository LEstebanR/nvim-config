-- Guardar rápido
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>i", { noremap = true, silent = true })

-- Abrir árbol de archivos
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Formatear manualmente
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true })

