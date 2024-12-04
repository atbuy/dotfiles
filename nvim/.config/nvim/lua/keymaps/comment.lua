local comment = require("Comment.api")

local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Toggle comment for line"
keymap("n", "<leader>/", comment.toggle.linewise.current, opts)


opts.desc = "Toggle comment for selection"
keymap("v", "<leader>/", "<Esc>:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
