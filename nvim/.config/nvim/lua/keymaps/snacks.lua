local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Open lazygit"
keymap("n", "<leader>lg", ":Snacks.lazygit()", opts)
