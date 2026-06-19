return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = true,
        terminal = true,
        overrides = {
          Normal             = { bg = "#242b38" },
          NormalNC           = { bg = "#242b38" },
          NormalFloat        = { bg = "#242b38" },
          SignColumn         = { bg = "#242b38" },
          NvimTreeNormal     = { bg = "#212838" },
          NvimTreeCursorLine = { bg = "#2e3848", bold = false },
          CursorLine         = { bg = "#2b3344" },
          MiniIconsAzure     = { fg = "#5c6773" },
          MiniIconsBlue      = { fg = "#5c6773" },
          MiniIconsCyan      = { fg = "#5c6773" },
          MiniIconsGreen     = { fg = "#5c6773" },
          MiniIconsGrey      = { fg = "#5c6773" },
          MiniIconsOrange    = { fg = "#5c6773" },
          MiniIconsPurple    = { fg = "#5c6773" },
          MiniIconsRed       = { fg = "#5c6773" },
          MiniIconsYellow    = { fg = "#5c6773" },
          MiniIconsWhite     = { fg = "#5c6773" },
          Visual             = { bg = "#3a5a7c", fg = "#e6edf3" },
        },
      })
      vim.cmd.colorscheme("ayu-mirage")
    end,
  },
}
