local opts = {
	noremap = true,
	silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Open diff"
keymap("n", "<leader>dio", ":DiffviewOpen<CR>", opts)

opts.desc = "Close diff"
keymap("n", "<leader>dic", ":DiffviewClose<CR>", opts)
