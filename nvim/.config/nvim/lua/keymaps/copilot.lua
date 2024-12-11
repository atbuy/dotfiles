local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Toggle copilot"
keymap("n", "<leader>cp", ":Copilot toggle<CR>", opts)


