return {
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
          vim.keymap.set("n", "gd",         vim.lsp.buf.definition,                            vim.tbl_extend("force", buf, { desc = "Go to definition" }))
          vim.keymap.set("n", "gr",         vim.lsp.buf.references,                            vim.tbl_extend("force", buf, { desc = "References" }))
          vim.keymap.set("n", "K",          vim.lsp.buf.hover,                                 vim.tbl_extend("force", buf, { desc = "Hover docs" }))
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,                                vim.tbl_extend("force", buf, { desc = "Rename" }))
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,                           vim.tbl_extend("force", buf, { desc = "Code action" }))
          vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", buf, { desc = "Format" }))
          vim.keymap.set("n", "[d",         vim.diagnostic.goto_prev,                          vim.tbl_extend("force", buf, { desc = "Prev diagnostic" }))
          vim.keymap.set("n", "]d",         vim.diagnostic.goto_next,                          vim.tbl_extend("force", buf, { desc = "Next diagnostic" }))
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

  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "normal" },
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
}
