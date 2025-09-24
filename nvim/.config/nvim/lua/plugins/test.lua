return {
  "nvim-neotest/neotest",
  cmd = {
    "NeotestRun",
    "NeotestStop",
    "NeotestSummary",
    "NeotestOutput",
    "NeotestOutputPanel",
  },
  keys = {
    { "<leader>tt",  function() require("neotest").run.run(vim.fn.expand("tests")) end,                  desc = "Run all tests" },
    { "<leader>tr",  function() require("neotest").run.run() end,                                        desc = "Run nearest test" },
    { "<leader>tf",  function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run current file" },
    { "<leader>td",  function() require("neotest").run.run({ strategy = "dap" }) end,                    desc = "Debug nearest test" },
    { "<leader>tst", function() require("neotest").run.stop() end,                                       desc = "Stop tests" },
    { "<leader>ta",  function() require("neotest").run.attach() end,                                     desc = "Attach nearest test" },
    { "<leader>tsm", function() require("neotest").summary.toggle() end,                                 desc = "Toggle test summary" },
    { "<leader>top", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Toggle output panel" },
  },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-vim-test",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          runner = "pytest"
        }),
        require("neotest-plenary"),
        require("neotest-vim-test")({
          ignore_file_types = { "python", "vim", "lua" }
        })
      }
    })
  end
}
