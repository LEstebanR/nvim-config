-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configurar leader keys antes de cargar plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Cargar configuraciones modulares
require("options")
require("mappings")

-- Configurar lazy.nvim con plugins
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  rocks = {
    enabled = false,  -- Deshabilitar luarocks completamente
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})


