return {
  -- ── Tema ──────────────────────────────────────────────────────────────────
  {
    "dupeiran001/nord.nvim",
    name = "nord-dupeiran",
    lazy = false,
    priority = 1000,
    config = function()
      -- background ya fue detectado en init.lua antes de cargar plugins
      local is_light = vim.o.background == "light"
      local nord_style = is_light and "light" or "dark"
      local nord_colorscheme = is_light and "nord-light" or "nord"
      require("nord").setup({
        style = nord_style,
        transparent = false,
        terminal_colors = true,
        styles = {
          comments  = { italic = true },
          keywords  = { italic = true, bold = true },
          functions = { bold = true },
          types     = { bold = true },
        },
      })
      local ok = pcall(vim.cmd.colorscheme, nord_colorscheme)
      if not ok then vim.cmd.colorscheme("nord") end

      -- En light mode los colores aurora son demasiado pálidos contra fondo blanco.
      -- Usamos versiones más saturadas/oscuras para que resalten correctamente.
      if is_light then
        local hl = vim.api.nvim_set_hl
        -- Frost (azules): keywords y funciones más contrastados
        hl(0, "@keyword",             { fg = "#4C74A0", bold = true,  italic = true })
        hl(0, "@keyword.return",      { fg = "#4C74A0", bold = true,  italic = true })
        hl(0, "@keyword.operator",    { fg = "#4C74A0", bold = true })
        hl(0, "@function",            { fg = "#4C74A0", bold = true })
        hl(0, "@function.call",       { fg = "#6A9FCC" })
        hl(0, "@method",              { fg = "#4C74A0", bold = true })
        hl(0, "@method.call",         { fg = "#6A9FCC" })
        -- Aurora: literals con colores más ricos
        hl(0, "@string",              { fg = "#5A8A5A" })   -- verde más oscuro
        hl(0, "@string.escape",       { fg = "#D08770" })
        hl(0, "@number",              { fg = "#BF616A" })   -- rojo aurora
        hl(0, "@boolean",             { fg = "#BF616A", bold = true })
        hl(0, "@constant",            { fg = "#C06A3A", bold = true }) -- naranja más saturado
        hl(0, "@constant.builtin",    { fg = "#BF616A", bold = true })
        -- Tipos
        hl(0, "@type",                { fg = "#3D8080", bold = true }) -- teal más oscuro
        hl(0, "@type.builtin",        { fg = "#3D8080" })
        hl(0, "Type",                 { fg = "#3D8080", bold = true })
        -- Parámetros y variables
        hl(0, "@parameter",           { fg = "#8C4A6E" })   -- mauve/purple sutil
        hl(0, "@variable.builtin",    { fg = "#BF616A", italic = true })
        -- Comentarios: gris más visible
        hl(0, "Comment",              { fg = "#7A8899", italic = true })
        hl(0, "@comment",             { fg = "#7A8899", italic = true })
        -- Puntuación menos prominente
        hl(0, "@punctuation.bracket", { fg = "#7A8899" })
        hl(0, "@operator",            { fg = "#4C74A0" })
      end
    end,
  },

  -- ── UI ────────────────────────────────────────────────────────────────────
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({ preset = "minimal", delay = 300, win = { border = "rounded" } })
      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "git hunks" },
        { "<leader>l", group = "lsp" },
        { "<leader>s", group = "split" },
      })
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = { border = "rounded", win_options = { winblend = 0 } },
      select = { backend = { "telescope", "builtin" }, builtin = { border = "rounded" } },
    },
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "nord",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", fmt = function(s) return s:sub(1, 3) end } },
        lualine_b = { { "branch", icon = "" } },
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "  " } },
        },
        lualine_x = {
          { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- ── Navegación ────────────────────────────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.5 },
            width = 0.85,
            height = 0.80,
          },
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        pickers = { find_files = { hidden = true } },
      })

      local b = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", b.find_files,   { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", b.live_grep,    { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", b.buffers,      { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fr", b.oldfiles,     { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fh", b.help_tags,    { desc = "Help" })
      vim.keymap.set("n", "<leader>fd", b.diagnostics,  { desc = "Diagnostics" })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = { width = 30, side = "left" },
      renderer = {
        group_empty = true,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = { glyphs = { folder = { arrow_closed = "", arrow_open = "" } } },
      },
      filters = { dotfiles = false },
      git = { enable = true, ignore = false },
    },
  },

  -- ── LSP ───────────────────────────────────────────────────────────────────
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
        icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "lua_ls", "ts_ls", "cssls", "html", "tailwindcss" },
          automatic_enable = false,
        },
      },
    },
    config = function()
      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      vim.lsp.config("ts_ls",       { cmd = { "typescript-language-server", "--stdio" } })
      vim.lsp.config("cssls",       { cmd = { "vscode-css-language-server", "--stdio" } })
      vim.lsp.config("html",        { cmd = { "vscode-html-language-server", "--stdio" } })
      vim.lsp.config("tailwindcss", { cmd = { "tailwindcss-language-server", "--stdio" } })

      vim.lsp.enable({ "lua_ls", "ts_ls", "cssls", "html", "tailwindcss" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = { buffer = args.buf, silent = true }
          vim.keymap.set("n", "gd",          vim.lsp.buf.definition,                  vim.tbl_extend("force", buf, { desc = "Go to definition" }))
          vim.keymap.set("n", "gr",          vim.lsp.buf.references,                  vim.tbl_extend("force", buf, { desc = "References" }))
          vim.keymap.set("n", "K",           vim.lsp.buf.hover,                       vim.tbl_extend("force", buf, { desc = "Hover docs" }))
          vim.keymap.set("n", "<leader>rn",  vim.lsp.buf.rename,                      vim.tbl_extend("force", buf, { desc = "Rename" }))
          vim.keymap.set("n", "<leader>ca",  vim.lsp.buf.code_action,                 vim.tbl_extend("force", buf, { desc = "Code action" }))
          vim.keymap.set("n", "<leader>lf",  function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", buf, { desc = "Format" }))
          vim.keymap.set("n", "[d",          vim.diagnostic.goto_prev,                vim.tbl_extend("force", buf, { desc = "Prev diagnostic" }))
          vim.keymap.set("n", "]d",          vim.diagnostic.goto_next,                vim.tbl_extend("force", buf, { desc = "Next diagnostic" }))
        end,
      })

      vim.diagnostic.config({
        virtual_text = { prefix = "●", spacing = 2 },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = true },
      })
    end,
  },

  -- ── Autocompletado ────────────────────────────────────────────────────────
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        menu = { border = "rounded" },
      },
      signature = { enabled = true, window = { border = "rounded" } },
    },
  },

  -- ── Formateo automático ───────────────────────────────────────────────────
  -- Requiere: npm i -g prettier  y  brew install stylua
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = {
      formatters_by_ft = {
        javascript      = { "prettier" },
        typescript      = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css             = { "prettier" },
        html            = { "prettier" },
        json            = { "prettier" },
        yaml            = { "prettier" },
        markdown        = { "prettier" },
        lua             = { "stylua" },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },

  -- ── Treesitter ────────────────────────────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "javascript", "typescript",
          "html", "css", "json", "yaml", "markdown", "tsx", "bash",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Auto-cierre de tags HTML/JSX
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- ── Edición ───────────────────────────────────────────────────────────────
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n" },
      { "gc",  mode = { "n", "o", "x" } },
    },
    config = true,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- ── Git ───────────────────────────────────────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "" },
          topdelete    = { text = "" },
          changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = vim.tbl_extend("force", opts or {}, { buffer = bufnr })
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Next hunk" })

          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Prev hunk" })

          map("n", "<leader>hs", gs.stage_hunk,                                       { desc = "Stage hunk" })
          map("n", "<leader>hr", gs.reset_hunk,                                       { desc = "Reset hunk" })
          map("n", "<leader>hp", gs.preview_hunk,                                     { desc = "Preview hunk" })
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end,       { desc = "Blame line" })
          map("n", "<leader>gb", gs.toggle_current_line_blame,                        { desc = "Toggle blame" })
        end,
      })
    end,
  },

  -- ── Visual helpers ────────────────────────────────────────────────────────
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = true, show_start = false, show_end = false },
      exclude = { filetypes = { "help", "NvimTree", "lazy", "mason" } },
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    opts = { signs = false },
  },

  { "nvim-lua/plenary.nvim", lazy = true },
}
