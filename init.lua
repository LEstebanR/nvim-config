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

-- Forzar apariencia oscura siempre
vim.o.background = "dark"

-- Configurar leader key
vim.g.mapleader = " "

-- Cargar configuraciones
require("options")
require("mappings")

-- Configurar lazy.nvim
require("lazy").setup({ { import = "plugins" } }, {
  change_detection = { notify = false },
  rocks = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "netrwPlugin", "tarPlugin", "tutor", "zipPlugin",
      },
    },
  },
})

-- Autocomandos (después de lazy: Snacks ya está disponible)
require("autocmds")


