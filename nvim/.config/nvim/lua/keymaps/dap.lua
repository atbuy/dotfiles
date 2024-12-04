local dap = require("dap")

local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap.set

opts.desc = "Toggle debugger breakpoint"
keymap("n", "<leader>dt", dap.toggle_breakpoint, opts)

opts.desc = "Launch debugging session"
keymap("n", "<leader>dbs", dap.continue, opts)

opts.desc = "Debugger step over"
keymap("n", "<leader>dso", dap.step_over, opts)

opts.desc = "Debugger step into"
keymap("n", "<leader>dsi", dap.step_into, opts)

opts.desc = "Debugger view state"
keymap("n", "<leader>dv", dap.repl.open)
