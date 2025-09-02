-- UI/Visual
vim.o.number = true                    -- Números de línea
vim.o.relativenumber = true            -- Números relativos
vim.o.signcolumn = "yes"               -- Siempre mostrar signcolumn
vim.o.cursorline = true                -- Resaltar línea actual
vim.o.termguicolors = true             -- Colores true color
vim.o.showmode = false                 -- No mostrar modo (lo hace lualine)
vim.o.wrap = false                     -- No hacer wrap de líneas
vim.o.scrolloff = 8                    -- Mantener 8 líneas al hacer scroll
vim.o.sidescrolloff = 8                -- Mantener 8 columnas al hacer scroll horizontal

-- Indentación
vim.o.tabstop = 4                      -- Tamaño de tab
vim.o.shiftwidth = 4                   -- Tamaño de indentación
vim.o.expandtab = true                 -- Usar espacios en lugar de tabs
vim.o.smartindent = true               -- Indentación inteligente
vim.o.autoindent = true                -- Auto indentación

-- Búsqueda
vim.o.ignorecase = true                -- Ignorar mayúsculas en búsqueda
vim.o.smartcase = true                 -- Ser inteligente con mayúsculas
vim.o.hlsearch = false                 -- No resaltar búsquedas
vim.o.incsearch = true                 -- Búsqueda incremental

-- Comportamiento
vim.o.hidden = true                    -- Permitir buffers ocultos
vim.o.splitbelow = true                -- Split horizontal hacia abajo
vim.o.splitright = true                -- Split vertical hacia la derecha
vim.o.updatetime = 250                 -- Tiempo de actualización más rápido
vim.o.timeoutlen = 500                 -- Tiempo para secuencias de teclas
vim.o.clipboard = "unnamedplus"        -- Usar clipboard del sistema
vim.o.mouse = "a"                      -- Habilitar mouse
vim.o.backup = false                   -- No crear backups
vim.o.writebackup = false              -- No crear backups temporales
vim.o.swapfile = false                 -- No crear swap files
vim.o.undofile = true                  -- Habilitar undo persistente

-- Completado
vim.o.completeopt = "menu,menuone,noselect"  -- Opciones de completado
vim.o.pumheight = 10                   -- Altura del popup de completado

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false               -- No empezar con folds cerrados

-- Configuraciones específicas de archivos
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "json", "html", "css" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

