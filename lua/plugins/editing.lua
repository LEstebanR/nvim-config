return {
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
}
