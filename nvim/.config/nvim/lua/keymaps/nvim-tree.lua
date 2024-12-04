local opts = {
	noremap = true,
	silent = true,
}

local keymap = vim.keymap.set

-- Open and focus Neotree
opts.desc = "Focus tree"
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)

-- Toggle tree
opts.desc = "Toggle tree"
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

