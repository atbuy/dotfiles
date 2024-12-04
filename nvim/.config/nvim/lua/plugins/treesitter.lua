return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = {
				"lua",

				-- Web
				"html",
				"css",
				"javascript",
				"typescript",

				-- Backend
				"python",
				"go",

				-- Low level
				"rust",
				"c",
			},
      auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
