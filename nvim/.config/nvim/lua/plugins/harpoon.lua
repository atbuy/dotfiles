return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>a",  function() require("harpoon.mark").add_file() end,        desc = "Add file to Harpoon" },
      { "<leader>s",  function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon menu" },
      { "<leader>1",  function() require("harpoon.ui").nav_file(1) end,         desc = "Harpoon go to file 1" },
      { "<leader>2",  function() require("harpoon.ui").nav_file(2) end,         desc = "Harpoon go to file 2" },
      { "<leader>3",  function() require("harpoon.ui").nav_file(3) end,         desc = "Harpoon go to file 3" },
      { "<leader>4",  function() require("harpoon.ui").nav_file(4) end,         desc = "Harpoon go to file 4" },
      { "<leader>5",  function() require("harpoon.ui").nav_file(5) end,         desc = "Harpoon go to file 5" },
      { "<leader>6",  function() require("harpoon.ui").nav_file(6) end,         desc = "Harpoon go to file 6" },
      { "<leader>7",  function() require("harpoon.ui").nav_file(7) end,         desc = "Harpoon go to file 7" },
      { "<leader>8",  function() require("harpoon.ui").nav_file(8) end,         desc = "Harpoon go to file 8" },
      { "<leader>9",  function() require("harpoon.ui").nav_file(9) end,         desc = "Harpoon go to file 9" },
      { "<leader>10", function() require("harpoon.ui").nav_file(10) end,        desc = "Harpoon go to file 10" },
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
