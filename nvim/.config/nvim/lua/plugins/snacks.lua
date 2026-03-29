return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    image = { enabled = true },
    lazygit = { enabled = true },
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    scroll = {},
    notifier = {
      level = vim.log.levels.WARN,
    },
    indent = {
      enabled = true,
      animate = {
        duration = {
          step = 20,
          total = 250,
        }
      }
    },
    dashboard = {
      enabled = true,
      width = 100,
      pane_gap = 4,
      preset = {
        header = [[
                               ██▒   █▓ ██▓ ███▄ ▄███▓
 ██▄████▄   ▄████▄    ▄████▄  ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
 ██▀   ██  ██▄▄▄▄██  ██▀  ▀██  ▓██  █▒░▒██▒▓██    ▓██░
 ██    ██  ██▀▀▀▀▀▀  ██    ██   ▒██ █░░░██░▒██    ▒██
 ██    ██  ▀██▄▄▄▄█  ▀██▄▄██▀    ▒▀█░  ░██░▒██▒   ░██▒
 ▀▀    ▀▀    ▀▀▀▀▀     ▀▀▀▀      ░ ▐░  ░▓  ░ ▒░   ░  ░
                                 ░ ░░   ▒ ░░  ░      ░
                                   ░░   ▒ ░░      ░
                                    ░   ░         ░
                                   ░
        ]]
      },
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "fortune -s | cowsay",
          padding = 1,
          ttl = 1,
          pane_gap = 5,
        },
        { section = "keys",  gap = 1, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Recent Files",
          section = "recent_files",
          indent = 2,
          padding = 1,
        },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
  keys = {
    { "<leader>lg", function() require("snacks").lazygit() end,               desc = "Lazygit" },
    { "<leader>nh", function() require("snacks").notifier.show_history() end, desc = "Show notification history" },
  }
}
