local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  api.config.mappings.default_on_attach(bufnr)

  -- -- Delete default mapping <C-e>
  vim.keymap.del("n", "<C-e>", { buffer = bufnr })
  vim.keymap.del("n", "f", { buffer = bufnr })
  vim.keymap.del("n", "<tab>", { buffer = bufnr })
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvim_tree = require("nvim-tree")
    nvim_tree.setup({
      on_attach = on_attach,
      update_focused_file = { enable = true },
      filters = { dotfiles = false, git_ignored = false },
      git = { enable = true },
      view = {
        adaptive_size = false,
        side = "left",
        width = 30,
        preserve_window_proportions = true,
      },
      renderer = {
        icons = {
          show = {
            git = true,
          },
        },
      },
    })

    -- Focus on tree on setup
    -- vim.cmd("NvimTreeFocus")

    require("keymaps.nvim-tree")
  end,
}
