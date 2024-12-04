return {
  "3rd/image.nvim",
  build = false,
  opts = {},
  config = function()
    require("image").setup({
      backend = "kitty",
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          filetypes = { "markdown", "vimwiki" },
        }
      },
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }
    })
  end,
}
