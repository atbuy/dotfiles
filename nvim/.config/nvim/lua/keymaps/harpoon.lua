local harpoon = require("harpoon")

local opts = {
	noremap = true,
	silent = true,
}

local keymap = vim.keymap.set

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

opts.desc = "List harpooned files in telescope"
keymap("n", "<C-e>", function()
	toggle_telescope(harpoon:list())
end, opts)

opts.desc = "List harpooned files"
keymap("n", "<leader>hf", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, opts)

opts.desc = "Add file to harpoon"
keymap("n", "<leader>ha", function()
	harpoon:list():add()
end, opts)
