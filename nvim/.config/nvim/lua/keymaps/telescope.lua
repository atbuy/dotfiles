local telescope = require("telescope.builtin")

local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Find files"
keymap("n", "<leader>ff", telescope.find_files, opts)

opts.desc = "Find all"
keymap("n", "<leader>fa", function()
  telescope.find_files({
    follow = true,
    no_ignore = true,
    hidden = true,
  })
end, opts)

opts.desc = "Live grep"
keymap("n", "<leader>fw", telescope.live_grep, opts)

opts.desc = "Find buffers"
keymap("n", "<leader>fb", telescope.buffers, opts)

opts.desc = "Help page"
keymap("n", "<leader>fh", telescope.help_tags, opts)

opts.desc = "Find old files"
keymap("n", "<leader>fo", telescope.oldfiles, opts)

opts.desc = "Find in current buffer"
keymap("n", "<leader>fz", telescope.current_buffer_fuzzy_find, opts)

opts.desc = "View git commits"
keymap("n", "<leader>cm", telescope.git_commits, opts)

opts.desc = "View git status"
keymap("n", "<leader>gt", telescope.git_status, opts)

opts.desc = "View all marks"
keymap("n", "<leader>ma", telescope.marks, opts)
