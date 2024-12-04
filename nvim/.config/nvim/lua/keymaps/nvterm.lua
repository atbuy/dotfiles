local nvterm = require("nvterm.terminal")

local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Toggle floating terminal"
keymap({ "n", "t" }, "<A-i>", function()
  nvterm.toggle("float")
end, opts)

opts.desc = "Toggle horizontal terminal"
keymap({ "n", "t" }, "<A-h>", function()
  nvterm.toggle("horizontal")
end, opts)

opts.desc = "Toggle vertical terminal"
keymap({ "n", "t" }, "<A-v>", function()
  nvterm.toggle("vertical")
end, opts)
