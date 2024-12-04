return {
  "mfussenegger/nvim-dap",
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
    dap_python.setup("~/.pyenv/versions/3.12.7/envs/debugpy/bin/python")
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
