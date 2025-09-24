return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        -- null_ls.builtins.formatting.stylua,

        -- Go
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.goimports_reviser,

        -- Rust
        -- null_ls.builtins.formatting.rustfmt,
        -- null_ls.builtins.diagnostics.ltrs,

        -- Javascript
        null_ls.builtins.formatting.prettier,
        -- require("none-ls.diagnostics.eslint_d"),
      },
    })

    require("keymaps.none-ls")
  end,
  dependencies = { "nvimtools/none-ls-extras.nvim" },
}
