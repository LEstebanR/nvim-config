return {
  {
    "folke/snacks.nvim",
    priority = 900,
    lazy = false,
    opts = {
      dashboard = {
        preset = {
          header = [[
  ███╗   ██╗██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██║   ██║██║████╗ ████║
  ██╔██╗ ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          keys = {
            { icon = " ", key = "f", desc = "Find File",    action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File",     action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Live Grep",    action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config",       action = ":e $MYVIMRC" },
            { icon = "󰒲 ", key = "L", desc = "Lazy",        action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit",         action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },

      notifier = {
        enabled = true,
        timeout = 3000,
        style = "compact",
        top_down = false,
      },

      scroll = {
        enabled = true,
        animate = {
          duration = { step = 15, total = 150 },
          easing = "linear",
        },
      },

      indent = {
        enabled = true,
        indent = { char = "│", only_scope = false, only_current = false },
        scope  = { enabled = true, char = "│", underline = false },
        chunk  = { enabled = false },
      },

      scope  = { enabled = true },
      words  = { enabled = true, debounce = 200, notify_jump = false },
      input  = { enabled = true },
      picker = { enabled = false },

      quickfile  = { enabled = true },
      bigfile    = { enabled = false },
      bufdelete  = { enabled = true },
      explorer   = { enabled = false },
      git        = { enabled = false },
      gitbrowse  = { enabled = false },
      lazygit    = { enabled = false },
      rename     = { enabled = false },
      terminal   = { enabled = false },
      toggle     = { enabled = false },
      zen        = { enabled = false },
    },
  },
}
