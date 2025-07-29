return {
	"saghen/blink.cmp",
	dependencies = {
		{ "rafamadriz/friendly-snippets" },
		{ "Kaiser-Yang/blink-cmp-git" },
		{ "Kaiser-Yang/blink-cmp-dictionary" },
	},
	version = "1.*",
	opts = {
		keymap = {
			preset = "none",
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			accept = { auto_brackets = { enabled = true } },
			ghost_text = {
				enabled = false,
				show_with_menu = true,
			},
			menu = {
				auto_show = true,
				border = "rounded",
				winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
			},
			keyword = { range = "full" },
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			trigger = {
				show_on_trigger_character = true,
				show_in_snippet = false,
			},
			documentation = { auto_show = true, window = { border = "rounded" } },
		},
		sources = {
			default = { "git", "dictionary", "lsp", "path", "snippets", "buffer" },
			providers = {
				git = {
					module = "blink-cmp-git",
					name = "Git",
					enabled = function()
						return vim.tbl_contains({ "octo", "gitcommit", "markdown" }, vim.bo.filetype)
					end,
					opts = {},
				},
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dictionary",
					min_keyword_length = 3,
					opts = {},
				},
			},
		},
		fuzzy = { implementation = "prefer_rust" },
	},
	opts_extend = { "sources.default" },
}
