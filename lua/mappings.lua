local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================================================
-- NAVEGACIÓN Y MOVIMIENTO
-- ============================================================================

-- Movimiento mejorado en modo insert
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)

-- Navegar entre ventanas
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Redimensionar ventanas
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navegar entre buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- ============================================================================
-- EDICIÓN
-- ============================================================================

-- Guardar rápido
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<Esc>:w<CR>i", opts)

-- Mover líneas arriba/abajo
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Indentación en modo visual
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Mantener selección al pegar
keymap("v", "p", '"_dP', opts)

-- Salir de insert mode
keymap("i", "jk", "<Esc>", opts)

-- ============================================================================
-- BÚSQUEDA Y REEMPLAZO
-- ============================================================================

-- Limpiar resaltado de búsqueda
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Búsqueda y reemplazo rápido
keymap("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- ============================================================================
-- EXPLORADOR DE ARCHIVOS
-- ============================================================================

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ef", ":NvimTreeFocus<CR>", opts)

-- ============================================================================
-- TELESCOPE (se configurará cuando se agregue)
-- ============================================================================

-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- ============================================================================
-- LSP
-- ============================================================================

-- Formatear manualmente
keymap("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)

-- ============================================================================
-- TERMINAL
-- ============================================================================

-- Terminal flotante
keymap("n", "<C-\\>", ":ToggleTerm<CR>", opts)
keymap("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", opts)

-- Salir del modo terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "jk", "<C-\\><C-n>", opts)

-- ============================================================================
-- UTILIDADES
-- ============================================================================

-- Centrar la pantalla al navegar
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Mejor experiencia con J
keymap("n", "J", "mzJ`z", opts)

-- Undo breakpoints
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)

