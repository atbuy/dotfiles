return {
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
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
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog", "MasonInstallAll" },
    config = function()
      local mason_packages = {
        -- Python
        "pyright",
        "ruff",
        "debugpy",
        "mypy",

        -- Lua
        "stylua",
        "lua-language-server",

        -- Go
        "gopls",
        "golines",
        "gofumpt",
        "goimports-reviser",

        -- C
        "clangd",

        -- PHP
        "phpactor",

        -- Arduino
        "arduino-language-server",

        -- Rust
        "rust-analyzer",

        -- SystemVerilog
        -- "svls",

        -- Javascript
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "prettier",
        "eslint-lsp",
        "eslint_d",
        "tailwindcss-language-server",
        "typescript-language-server",

        -- Zig
        "zls",

        -- Java
        "jdtls",

        -- Docker
        "dockerfile-language-server",
        "docker-compose-language-service",

        -- SQL
        "sqlls",

        -- Typst
        "tinymist",
        "typstyle",

        -- Others
        "taplo",                     -- TOML
        "jq-lsp",                    -- JSON
        "yaml-language-server",      -- YAML
        "autotools-language-server", -- Make
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
    event = "BufReadPre",
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

      -- PHP
      vim.lsp.enable("phpactor")

      -- Arduino
      vim.lsp.config.arduino_language_server = {
        cmd = {
          "arduino-language-server",
          "-clangd", "/usr/bin/clangd",
          "-cli", "/usr/bin/arduino-cli",
          "-cli-config", "~/.arduino15/arduino-cli.yaml",
          "-fqbn", "arduino:avr:nano",
        }

      }

      vim.lsp.enable("arduino_language_server")

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

      -- Typst
      vim.lsp.config["tinymist"] = {
        settings = {
          formatterMode = "typstyle",
        }
      }
      vim.lsp.enable("tinymist")

      -- lspconfig.svls.setup({ capabilities = capabilities })
      -- lspconfig.phpactor.setup({ capabilities = capabilities })
      -- lspconfig.powershell_es.setup({ capabilities = capabilities })
      -- lspconfig.zls.setup({ capabilities = capabilities })

      -- Keymaps
      require("keymaps.lspconfig")
    end,
  },
}
