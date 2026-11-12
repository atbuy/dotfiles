require("git"):setup {
  order = 1500,
}

require("full-border"):setup()

require("bookmarks"):setup({
  persist = "all",
  desc_format = "parent",
  file_pick_mode = "parent",
  custom_desc_input = true,
  show_keys = true,
  notify = {
    enable = true,
    timeout = 2,
  },
})
