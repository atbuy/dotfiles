return {
  "numToStr/Comment.nvim",
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
