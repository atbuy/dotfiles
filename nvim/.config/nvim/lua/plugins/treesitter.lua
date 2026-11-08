return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  -- The main branch does not support lazy-loading
  lazy = false,
  config = function()
    local ts = require("nvim-treesitter")

    ts.install({
      "lua",

      -- Web
      "html",
      "css",
      "javascript",
      "typescript",

      -- Backend
      "python",
      "go",

      -- Low level
      "rust",
      "c",

      -- Used by LSP hover/completion docs
      "markdown",
      "markdown_inline",
    })

    local function enable(buf, lang)
      if not pcall(vim.treesitter.start, buf, lang) then
        return
      end
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_setup", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
          return
        end

        if vim.list_contains(ts.get_installed(), lang) then
          enable(args.buf, lang)
        elseif vim.list_contains(ts.get_available(), lang) then
          -- Equivalent of the old `auto_install = true`
          ts.install(lang):await(function()
            if vim.api.nvim_buf_is_valid(args.buf) then
              enable(args.buf, lang)
            end
          end)
        end
      end,
    })
  end,
}
