return {
  { "MunifTanjim/nui.nvim", lazy = true },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "folke/snacks.nvim" },
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline     = { pattern = "^:",       icon = "", lang = "vim" },
          search_down = { kind = "search",      icon = " ", lang = "regex" },
          search_up   = { kind = "search",      icon = " ", lang = "regex" },
          filter      = { pattern = "^:%s*!",   icon = "$", lang = "bash" },
          lua         = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help        = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
        },
      },

      messages = {
        enabled      = true,
        view         = "notify",
        view_error   = "notify",
        view_warn    = "notify",
        view_history = "messages",
        view_search  = "virtualtext",
      },

      popupmenu = { enabled = false },

      lsp = {
        progress  = { enabled = false },
        hover     = { enabled = false },
        signature = { enabled = false },
        message   = { enabled = true, view = "notify" },
        override  = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },

      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = "written" },
            },
          },
          opts = { skip = true },
        },
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
        {
          filter = { event = "msg_show", min_height = 10 },
          view = "split",
          opts = { enter = true },
        },
      },

      views = {
        cmdline_popup = {
          position = { row = "35%", col = "50%" },
          size     = { width = 60, height = "auto" },
          border   = { style = "rounded", padding = { 0, 1 } },
        },
      },

      presets = {
        command_palette       = true,
        long_message_to_split = true,
        lsp_doc_border        = true,
        bottom_search         = false,
        inc_rename            = false,
      },
    },

    keys = {
      { "<leader>nl", function() require("noice").cmd("last") end,    desc = "Noice last message" },
      { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice history" },
      { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss notifications" },
    },
  },
}
