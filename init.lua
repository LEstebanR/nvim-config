-- Configuración básica de Neovim
vim.o.number = true      -- Mostrar números de línea
vim.o.relativenumber = true  -- Números relativos
vim.o.tabstop = 4        -- Tamaño de tabulación
vim.o.shiftwidth = 4     -- Espaciado al indentar
vim.o.expandtab = true   -- Convertir tabs en espacios
vim.o.termguicolors = true  -- Soporte de colores

-- Mapeo para guardar con Ctrl + S
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- Cargar tema
--vim.cmd.colorscheme("desert")

----lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    -- Explorador de archivos
    { "nvim-tree/nvim-tree.lua" },
    -- Barra de estado
    { "nvim-lualine/lualine.nvim" },
    -- LSP para autocompletado
    { "neovim/nvim-lspconfig" },
    -- Autocompletado inteligente
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "L3MON4D3/LuaSnip" },

    -- Formateo de código automático
    { "jose-elias-alvarez/null-ls.nvim" },

    -- Git en Neovim
    { "lewis6991/gitsigns.nvim" },

    -- Terminal dentro de Neovim
    { "akinsho/toggleterm.nvim" },

    -- Depuración
    { "mfussenegger/nvim-dap" },

    -- Tema Nord
    { "shaunsingh/nord.nvim" },

    -- Font
    { "nvim-tree/nvim-web-devicons" },

    checker = { enabled = true },
})


--local 
lspconfig = require("lspconfig")
lspconfig.pyright.setup({})  -- Python
lspconfig.ts_ls.setup({}) -- JavaScript/TypeScript

require("nvim-tree").setup()


-- Mapeo para abrir el explorador con <leader>e
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Cargar theme
vim.cmd.colorscheme "nord"


-- Catgar fuente
require("nvim-web-devicons").setup({})
