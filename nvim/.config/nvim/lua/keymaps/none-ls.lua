local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Format file"
keymap("n", "<leader>fm", function()
  vim.lsp.buf.format()
  local clients = vim.lsp.get_clients()
  for _, client in ipairs(clients) do
    local name = client["name"]
    if name == "ruff" then
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
      })
    end
  end
end, opts)
