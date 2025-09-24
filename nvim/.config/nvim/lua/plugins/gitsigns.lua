return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "gb", function() require("gitsigns").blame_line() end,     "Git blame line" },
    { "td", function() require("gitsigns").toggle_deleted() end, desc = "Toggle deleted lines" },
    {
      "]c",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          require("gitsigns").nav_hunk("next")
        end
      end,
      desc = "Go to next hunk"
    },
    {
      "[c",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end,
      desc = "Go to previous hunk"
    },

  },
  opts = {},
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
