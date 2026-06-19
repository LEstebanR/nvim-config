return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      progress = {
        suppress_on_insert = true,
        display = {
          render_limit  = 4,
          done_ttl      = 2,
          done_icon     = "✓",
          progress_icon = { pattern = "dots", period = 1 },
          skip_history  = true,
        },
      },
      notification = {
        override_vim_notify = false,
        window = {
          normal_hl = "Comment",
          winblend  = 0,
          border    = "none",
          align     = "bottom",
          relative  = "editor",
        },
      },
    },
  },
}
