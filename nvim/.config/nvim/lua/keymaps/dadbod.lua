local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Toggle DBUI"
keymap("n", "<leader>dbt", ":DBUIToggle<CR>", opts)

opts.desc = "Add new DBUI connection"
keymap("n", "<leader>dba", ":DBUIAddConnection<CR>", opts)
