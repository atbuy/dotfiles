return {
  "mfussenegger/nvim-dap",
  cmd = {
    "DapContinue",
    "DapToggleBreakpoint",
    "DapStepInto",
    "DapStepOver",
    "DapStepOut",
    "DapTerminate",
  },
  keys = {
    { "<leader>dt",  function() require("dap").toggle_breakpoint() end, desc = "Toggle debugger breakpoint" },
    { "<leader>dbs", function() require("dap").continue() end,          desc = "Launch debugging session" },
    { "<leader>dso", function() require("dap").step_over() end,         desc = "Debugger step over" },
    { "<leader>dsi", function() require("dap").step_into() end,         desc = "Debugger step into" },
    { "<leader>dv",  function() require("dap").repl.open() end,         desc = "Debugger view state" },
  },
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()

    local dap_python = require("dap-python")
    dap_python.setup("~/.pyenv/versions/debugpy/bin/python")
    dap_python.test_runner = "pytest"

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    require("keymaps.dap")

    vim.fn.sign_define("DapBreakpoint", { text = "•", texthl = "red", linehl = "", numhl = "" })
  end
}
