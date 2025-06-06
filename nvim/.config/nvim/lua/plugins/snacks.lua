return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    lazygit = { enabled = true },
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    dashboard = {}
  },
  keys = {
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit"},
  }
}
