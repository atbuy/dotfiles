local neotest = require("neotest")

local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Run all tests"
keymap("n", "<leader>tt", function()
  neotest.run.run(vim.fn.expand("tests"))
end, opts)

opts.desc = "Run nearest test"
keymap("n", "<leader>tr", neotest.run.run, opts)

opts.desc = "Run current file"
keymap("n", "<leader>T", function()
  neotest.run.run(vim.fn.expand("%"))
end, opts)

opts.desc = "Debug the nearest test"
keymap("n", "<leader>td", function()
  neotest.run.run({ strategy = "dap" })
end, opts)

opts.desc = "Stop tests"
keymap("n", "<leader>st", neotest.run.stop, opts)

opts.desc = "Attach nearest test"
keymap("n", "<leader>ta", neotest.run.attach, opts)

opts.desc = "Toggle test summary"
keymap("n", "<leader>ts", neotest.summary.toggle, opts)

opts.desc = "Toggle output panel"
keymap("n", "<leader>top", function()
  neotest.output.open({ enter = true, auto_close = true })
end, opts)
