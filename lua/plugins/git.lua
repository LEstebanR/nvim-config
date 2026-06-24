return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
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

          map("n", "<leader>hs", gs.stage_hunk,                                 { desc = "Stage hunk" })
          map("n", "<leader>hr", gs.reset_hunk,                                 { desc = "Reset hunk" })
          map("n", "<leader>hp", gs.preview_hunk,                               { desc = "Preview hunk" })
          map("n", "<leader>hd", gs.toggle_deleted,                             { desc = "Toggle deleted lines" })
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
          map("n", "<leader>gb", gs.toggle_current_line_blame,                  { desc = "Toggle blame" })
        end,
      })
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    opts = { signs = false },
  },
}
