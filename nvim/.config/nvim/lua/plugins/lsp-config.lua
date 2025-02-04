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
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Lua
					"lua_ls",

					-- Web
					"ts_ls",
					"html",
					"cssls",
					"eslint",
					"emmet_ls",
					"tailwindcss",

					-- Backend
					"ruff",
					"gopls",
					"phpactor",

					-- Low level
					"rust_analyzer",
					-- "clangd",

					-- SQL
					-- "sqlls",

					-- Make
					"autotools_ls",

					-- SystemVerilog
					-- "svls",

					-- Docker
					"dockerls",
					"docker_compose_language_service",

					-- Java
					-- "kotlin_language_server",

					-- Others
					"jsonls",
					"yamlls",
          "taplo",
					-- "powershell_es",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.eslint.setup({ capabilities = capabilities })
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"scss",
					"less",
					"sass",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"php",
				},
			})
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			-- lspconfig.svls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "off",
						},
					},
				},
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
				filetypes = { "python" },
			})
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.phpactor.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.sqlls.setup({ capabilities = capabilities })
			lspconfig.autotools_ls.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
			lspconfig.kotlin_language_server.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })
			lspconfig.taplo.setup({ capabilities = capabilities })
			lspconfig.powershell_es.setup({ capabilities = capabilities })

			-- Keymaps
			require("keymaps.lspconfig")
		end,
		opts = {
			servers = {
				svls = {
					root_dir = function(_)
						return require("lspconfig.util").find_git_ancestor
					end,
					cmd = { "svls" },
					filetypes = { "verilog", "systemverilog" },
				},
			},
		},
	},
}
