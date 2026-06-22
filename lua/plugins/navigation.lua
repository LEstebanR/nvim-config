return {
  { "nvim-lua/plenary.nvim", lazy = true },

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
      vim.keymap.set("n", "<leader>ff", b.find_files,  { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", b.live_grep,   { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", b.buffers,     { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fr", b.oldfiles,    { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fh", b.help_tags,   { desc = "Help" })
      vim.keymap.set("n", "<leader>fd", b.diagnostics, { desc = "Diagnostics" })
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
      -- Lo manejamos en lua/autocmds.lua para controlar el layout.
      hijack_directories = { enable = false },
    },
  },
}
