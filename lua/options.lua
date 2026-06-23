-- Colores (debe ir primero)
vim.o.termguicolors = true
-- background lo setea el tema según el sistema (ver plugins.lua)

-- UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.showmode = false
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.cursorline = true
vim.o.pumheight = 10

-- Indentación
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Búsqueda
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- Comportamiento
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.updatetime = 250
vim.o.timeoutlen = 500
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.autoread = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.hidden = true
vim.o.fileencoding = "utf-8"

-- Completado
vim.o.completeopt = "menu,menuone,noselect"
vim.cmd([[set shortmess+=c]])

-- Cursor
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250,r-cr-o:hor20"

-- Misc
vim.o.conceallevel = 0
vim.o.laststatus = 3

