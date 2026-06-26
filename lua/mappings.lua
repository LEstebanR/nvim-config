local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Navegación entre ventanas
keymap("n", "<C-h>", "<C-w>h", { desc = "Window left" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Window down" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Window up" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Redimensionar ventanas
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprev<CR>", { desc = "Prev buffer" })
keymap("n", "<leader>x", function() Snacks.bufdelete() end, { desc = "Close buffer" })

-- Guardar y salir
keymap("n", "<C-s>", ":w<CR>", { desc = "Save" })
keymap("i", "<C-s>", "<Esc>:w<CR>", opts)

-- Cierra el split actual; si es la última ventana "normal" (sin contar flotantes
-- ni la barra de NvimTree), borra el buffer en su lugar para que reaparezca el
-- dashboard en vez de salir de Neovim. Para salir del todo: <leader>Q.
local function normal_win_count()
  local count = 0
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == ""
      and vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "NvimTree"
    then
      count = count + 1
    end
  end
  return count
end

keymap("n", "<leader>q", function()
  if normal_win_count() > 1 then
    vim.cmd("q")
  else
    Snacks.bufdelete()
  end
end, { desc = "Close window / file" })
keymap("n", "<leader>Q", ":qa<CR>", { desc = "Quit all" })
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- Salir de insert
keymap("i", "jk", "<Esc>", opts)

-- Mantener cursor centrado
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Indentación visual
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Mover líneas
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Explorador
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File explorer" })

-- Limpiar búsqueda
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Mejor pegado
keymap("v", "p", '"_dP', opts)

-- Splits
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontal" })

-- Formato manual (conform)
keymap("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

-- Diagnósticos flotantes
keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Diagnostic float" })
