-- UI/Visual (minimalista)
vim.o.number = true                    -- Números de línea
vim.o.relativenumber = false           -- Deshabilitar números relativos para ser más limpio
vim.o.signcolumn = "auto"              -- Mostrar signcolumn solo cuando sea necesario
vim.o.cursorline = false               -- Deshabilitar resaltado de línea actual
vim.o.termguicolors = true             -- Colores true color
vim.o.showmode = false                 -- No mostrar modo (lo hace lualine)
vim.o.wrap = true                      -- Hacer wrap de líneas largas
vim.o.linebreak = true                 -- Romper líneas en palabras completas
vim.o.breakindent = true               -- Mantener indentación en líneas wrapeadas
vim.o.scrolloff = 5                    -- Reducir líneas al hacer scroll
vim.o.sidescrolloff = 5                -- Reducir columnas al hacer scroll horizontal
vim.o.showcmd = false                  -- No mostrar comandos parciales
vim.o.ruler = false                    -- No mostrar ruler
vim.o.showmatch = false                -- No resaltar paréntesis coincidentes

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
vim.o.pumheight = 8                    -- Altura del popup de completado (reducida)

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false               -- No empezar con folds cerrados


-- Configuraciones específicas de archivos
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "json", "html", "css", "jsx", "tsx" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Configuración específica para JSX/TSX
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "jsx", "tsx" },
  callback = function()
    -- Asegurar que se use el resaltado de sintaxis correcto
    vim.opt_local.syntax = "on"
    vim.opt_local.filetype = vim.bo.filetype
    -- Forzar el uso del parser tsx para archivos jsx
    if vim.bo.filetype == "jsx" then
      vim.treesitter.language.register("tsx", "jsx")
    end
  end,
})

