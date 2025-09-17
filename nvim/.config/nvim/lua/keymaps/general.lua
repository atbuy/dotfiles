local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

-- Shortcuts to moving through windows
opts.desc = "Move one window right"
keymap("n", "<C-l>", "<C-w>l", opts)

opts.desc = "Move one window up"
keymap("n", "<C-k>", "<C-w>k", opts)

opts.desc = "Move one window down"
keymap("n", "<C-j>", "<C-w>j", opts)

opts.desc = "Move one window left"
keymap("n", "<C-h>", "<C-w>h", opts)

-- Save file
opts.desc = "Save file"
keymap("n", "<C-s>", ":update<CR>", opts)

opts.desc = "Save file in insert mode"
keymap("i", "<C-s>", "<Esc>:update<CR>a", opts)

-- Quick exit neovim
opts.desc = "Quick exit"
keymap("n", "<leader>q2", ":qa<CR>", opts)

-- Clear all highlights
opts.desc = "Clear highlights"
keymap("n", "<Esc>", ":noh <CR>", opts)

-- Copy whole file
opts.desc = "Copy whole file"
keymap("n", "<C-c>", ":%y+<CR>", opts)

-- Format JSON with jq
opts.desc = "Format JSON file with jq"
keymap("n", "<leader>fj", ":%!jq --sort-keys '.'<CR>", opts)
