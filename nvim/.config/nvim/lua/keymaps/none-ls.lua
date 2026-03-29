local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Format file"
keymap("n", "<leader>fm", function()
  vim.lsp.buf.format()
  local clients = vim.lsp.get_clients()
  local ruff_formatted = false

  for _, client in ipairs(clients) do
    local name = client["name"]

    if name == "ruff" and not ruff_formatted then
      ruff_formatted = false
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
      })
    end
  end
end, opts)
