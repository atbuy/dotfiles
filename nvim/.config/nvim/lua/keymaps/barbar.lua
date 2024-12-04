local opts = {
noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Go to next buffer"
keymap("n", "<Tab>", ":BufferNext<CR>", opts)

opts.desc = "Go to previous buffer"
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", opts)

opts.desc = "Close current buffer"
keymap("n", "X", ":BufferClose<CR>", opts)
