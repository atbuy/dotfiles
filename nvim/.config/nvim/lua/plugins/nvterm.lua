return {
  "NvChad/nvterm",
  keys = {
    { "<A-i>", function() require("nvterm.terminal").toggle("float") end,      mode = { "n", "t" }, desc = "Toggle floating terminal" },
    { "<A-h>", function() require("nvterm.terminal").toggle("horizontal") end, mode = { "n", "t" }, desc = "Toggle horizontal terminal" },
    { "<A-v>", function() require("nvterm.terminal").toggle("vertical") end,   mode = { "n", "t" }, desc = "Toggle vertical terminal" },
  },
  config = function()
    require("nvterm").setup()
  end,

}
