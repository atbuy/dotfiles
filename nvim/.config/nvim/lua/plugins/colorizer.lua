return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    local colorizer = require("colorizer")
    colorizer.setup({
      filetypes = {
        "css",
        "javascript",
        html = { mode = "foreground" },
      },
    })
  end,
}
