return {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      handler_opts = { border = "rounded" },
      hint_enable = false,
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)

      -- Change color of highlight group
      vim.cmd("highlight LspSignatureActiveParameter guifg=#ff3131")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      local mason_packages = {
        -- Python
        "pyright",
        "ruff",
        "debugpy",
        "mypy",
        "taplo", -- TOML

        -- Lua
        "stylua",

        -- Go
        "gopls",
        "golines",
        "gofumpt",
        "goimports-reviser",

        -- Rust
        "rust-analyzer",

        -- SystemVerilog
        -- "svls",

        -- Javascript
        "prettier",
        "eslint_d",

        -- Zig
        "zls",
      }

      require("mason").setup({
        ensure_installed = mason_packages,
      })

      -- Create MasonInstallAll command
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(mason_packages, " "))
      end, {})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Python
      vim.lsp.enable("pyright")
      vim.lsp.enable("ruff")

      -- Go
      vim.lsp.enable("gopls")

      -- HTML/CSS/JS
      vim.lsp.enable("emmet_ls")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("eslint")
      vim.lsp.enable("cssls")
      vim.lsp.enable("html")
      vim.lsp.enable("ts_ls")

      -- Lua
      vim.lsp.enable("lua_ls")

      -- Rust
      vim.lsp.enable("rust_analyzer")

      -- C
      vim.lsp.enable("clangd")

      -- Docker
      vim.lsp.enable("dockerls")
      vim.lsp.enable("docker_compose_language_service")

      -- Java
      vim.lsp.enable("jdtls")

      -- SQL
      vim.lsp.enable("sqlls")

      -- JSON
      vim.lsp.enable("jqls")

      -- YAML
      vim.lsp.enable("yamlls")

      -- TOML
      vim.lsp.enable("taplo")

      -- Make
      vim.lsp.enable("autotools_ls")

      -- lspconfig.svls.setup({ capabilities = capabilities })
      -- lspconfig.phpactor.setup({ capabilities = capabilities })
      -- lspconfig.powershell_es.setup({ capabilities = capabilities })
      -- lspconfig.zls.setup({ capabilities = capabilities })

      -- Keymaps
      require("keymaps.lspconfig")
    end,
  },
}
