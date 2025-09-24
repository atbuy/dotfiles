return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>dio", ":DiffviewOpen<CR>",  desc = "Open diff" },
    { "<leader>dic", ":DiffviewClose<CR>", desc = "Close diff" },
  },
}
