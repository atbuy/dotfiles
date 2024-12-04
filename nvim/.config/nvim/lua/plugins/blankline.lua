local opts = {
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = false,
  show_current_context_start = false,
}
return {
  "lukas-reineke/indent-blankline.nvim",
  version = "2.20.7",
  opts = opts,
  config = function()
    local ibl = require("indent_blankline")
    ibl.setup()
  end,
}
