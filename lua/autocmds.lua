local group = vim.api.nvim_create_augroup("AleluyaUI", { clear = true })

-- Bandera: estamos abriendo `nvim <carpeta>` (evita que el dashboard-on-empty
-- se dispare al borrar el buffer del directorio).
local opening_dir = false

-- ¿Hay algún buffer de archivo real abierto?
local function has_real_file()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf)
      and vim.bo[buf].buflisted
      and vim.bo[buf].buftype == ""
      and vim.api.nvim_buf_get_name(buf) ~= ""
    then
      return true
    end
  end
  return false
end

-- Abre el dashboard de snacks en una ventana concreta, NO flotante (igual que al arrancar).
local function open_dashboard(win)
  if _G.Snacks == nil then return end
  if not vim.api.nvim_win_is_valid(win) then return end
  if vim.api.nvim_win_get_config(win).relative ~= "" then return end
  if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "NvimTree" then return end
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(win, buf)
  Snacks.dashboard.open({ win = win, buf = buf })
end

-- Mostrar el dashboard cuando no quedan archivos abiertos, en lugar de un buffer vacío "negro".
vim.api.nvim_create_autocmd("BufDelete", {
  group = group,
  callback = function()
    vim.schedule(function()
      if opening_dir then return end
      if has_real_file() then return end
      open_dashboard(vim.api.nvim_get_current_win())
    end)
  end,
})

-- Al abrir `nvim <carpeta>` (p. ej. `nvim .`): entrar a la carpeta y mostrar
-- el árbol como barra lateral + el dashboard en el área principal.
vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  callback = function(data)
    if vim.fn.isdirectory(data.file) ~= 1 then return end
    opening_dir = true
    local dir, dirbuf = data.file, data.buf
    vim.schedule(function()
      vim.cmd.cd(dir)
      local win = vim.api.nvim_get_current_win()
      open_dashboard(win)                                  -- área principal
      pcall(vim.api.nvim_buf_delete, dirbuf, { force = true }) -- quitar el buffer del directorio
      require("nvim-tree.api").tree.open()                 -- barra lateral (deja el foco en el árbol)
      vim.schedule(function() opening_dir = false end)
    end)
  end,
})
