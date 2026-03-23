return {
  "nvim-mini/mini.ai",
  event = "BufReadPre",
  version = '*',
  config = function()
    local mini_ai = require("mini.ai")
    mini_ai.setup({
      custom_textobjects = {
        f = mini_ai.gen_spec.treesitter({
          a = "@function.outer",
          i = "@function.inner"
        })
      }
    })
  end
}
