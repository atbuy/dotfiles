return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>a", function() require("harpoon.mark").add_file() end,        desc = "Add file to Harpoon" },
      { "<leader>e", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon menu" },
      { "<leader>1", function() require("harpoon.ui").nav_file(1) end,         desc = "Harpoon go to file 1" },
      { "<leader>2", function() require("harpoon.ui").nav_file(2) end,         desc = "Harpoon go to file 2" },
      { "<leader>3", function() require("harpoon.ui").nav_file(3) end,         desc = "Harpoon go to file 3" },
      { "<leader>4", function() require("harpoon.ui").nav_file(4) end,         desc = "Harpoon go to file 4" },
    },
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          save_on_change = true,
          enter_on_sendcmd = true,
        },
      })
    end,
  },
}
