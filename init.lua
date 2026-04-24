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

-- Detectar apariencia del sistema antes de cargar plugins
local _h = io.popen("/usr/bin/defaults read -g AppleInterfaceStyle 2>/dev/null")
vim.o.background = (_h and _h:read("*l") == "Dark") and "dark" or "light"
if _h then _h:close() end

-- Configurar leader key
vim.g.mapleader = " "

-- Cargar configuraciones
require("options")
require("mappings")

-- Configurar lazy.nvim
require("lazy").setup("plugins", {
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


