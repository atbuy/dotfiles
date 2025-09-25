return {
  "nvim-mini/mini.ai",
  event = "BufReadPre",
  version = '*',
  config = function()
    require("mini.ai").setup()
  end
}
