local keys = {
  { "<leader>ff", ":Telescope find_files<CR>",                desc = "Find files" },
  { "<leader>fw", ":Telescope live_grep<CR>",                 desc = "Live grep" },
  { "<leader>fb", ":Telescope buffers<CR>",                   desc = "Find buffers" },
  { "<leader>fh", ":Telescope help_tags<CR>",                 desc = "Help page" },
  { "<leader>fo", ":Telescope oldfiles<CR>",                  desc = "Find old files" },
  { "<leader>fz", ":Telescope current_buffer_fuzzy_find<CR>", desc = "Find in current buffer" },
  { "<leader>cm", ":Telescope git_commits<CR>",               desc = "View git commits" },
  { "<leader>gt", ":Telescope git_status<CR>",                desc = "View git status" },
  { "<leader>ma", ":Telescope marks<CR>",                     desc = "View all marks" },
  {
    "<leader>fa",
    function()
      require("telescope.builtin").find_files({
        follow = true,
        no_ignore = true,
        hidden = true,
      })
    end,
    desc = "Find all"
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = keys,
    tag = "0.1.8",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          local telescope = require("telescope")

          telescope.setup({
            extensions = {
              ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
              },
            },
            pickers = {
              live_grep = {
                additional_args = function(_)
                  return { "--hidden", "--no-ignore" }
                end,
                file_ignore_patterns = { "node_modules", ".git", ".venv" },
              },
              find_files = {
                find_command = { "fd", "--type", "f", "--hidden", "--no-ignore" },
                file_ignore_patterns = { "node_modules", ".git", ".venv" },
                hidden = true,
              }
            }
          })

          telescope.load_extension("ui-select")
          telescope.load_extension("fzf")
        end,
      }
    },
  }
}
