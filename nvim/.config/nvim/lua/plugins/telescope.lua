return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
  },
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

      require("keymaps.telescope")
    end,
  },
}
