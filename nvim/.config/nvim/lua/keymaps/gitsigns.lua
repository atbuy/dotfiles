local gitsigns = require("gitsigns")

local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Git blame line"
keymap("n", "gb", gitsigns.blame_line, opts)

opts.desc = "Toggle deleted lines"
keymap("n", "td", gitsigns.toggle_deleted, opts)

opts.desc = "Go to next next"
keymap("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "]c", bang = true })
  else
    gitsigns.nav_hunk("next")
  end
end, opts)


opts.desc = "Go to previous change"
keymap("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "[c", bang = true })
  else
    gitsigns.nav_hunk("prev")
  end
end, opts)
