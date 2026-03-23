return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    local custom_sources = require("custom.none_ls")

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

        -- Custom
        custom_sources.typos.diagnostics,
        custom_sources.typos.code_actions,
      },
    })

    vim.diagnostic.config({
      update_in_insert = true,
    })

    require("keymaps.none-ls")
  end,
  dependencies = { "nvimtools/none-ls-extras.nvim" },
}
