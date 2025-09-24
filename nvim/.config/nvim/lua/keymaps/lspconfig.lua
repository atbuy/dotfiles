local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Hover definition"
keymap("n", "K", vim.lsp.buf.hover, opts)

opts.desc = "Go to definition"
keymap("n", "gd", vim.lsp.buf.definition, opts)

opts.desc = "Go to declaration"
keymap("n", "gD", vim.lsp.buf.declaration, opts)

opts.desc = "Code actions"
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

opts.desc = "Get references"
keymap("n", "gr", vim.lsp.buf.references, opts)

opts.desc = "Signature help"
keymap("n", "gk", vim.lsp.buf.signature_help, opts)

opts.desc = "Rename"
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

opts.desc = "Go to next diagnostic"
keymap("n", "]d", function()
  vim.diagnostic.goto_next({ float = { border = "rounded" } })
end, opts)

opts.desc = "Go to previous diagnostic"
keymap("n", "[d", function()
  vim.diagnostic.goto_prev({ float = { border = "rounded" } })
end, opts)
