return {
  {
    "stevearc/oil.nvim",
    cmd = { "Oil" },
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open Oil" },
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" }
    },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,

        columns = { "icon" },
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".."
          end,
        },
        win_options = {
          wrap = true,
          winblend = 10,
          cursorline = true,
        },
        keymaps = {
          ["<CR>"] = "actions.select",
          ["<C-s>"] = false,
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-t>"] = "actions.select_tab",
          ["-"] = "actions.parent",
          ["q"] = "actions.close",
        },
      })
    end,
  },
}
