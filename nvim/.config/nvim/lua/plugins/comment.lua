return {
  "numToStr/Comment.nvim",
  keys = {
    { "<leader>/", function() require("Comment.api").toggle.linewise.current() end,             modes = { "n" }, desc = "Toggle comment for line" },
    { "<leader>/", "<Esc>:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", modes = { "v" }, desc = "Toggle comment for selection" },
  },
  config = function()
    require("Comment").setup({
      padding = true,
      mappings = {
        basic = false,
        extra = false,
      },
    })

    require("keymaps.comment")
  end,
}
