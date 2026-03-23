local null_ls = require("null-ls")
local h = require("null-ls.helpers")

local DIAGNOSTICS = null_ls.methods.DIAGNOSTICS
local CODE_ACTION = null_ls.methods.CODE_ACTION

local filetypes = {
  "python",
  "lua",
  "markdown",
  "text",
  "c",
  "cpp",
  "rust",
  "go",
  "javascript",
  "typescript",
  "sh",
  "zsh",
}

local function typo_position(item)
  local row = item.line_num or 1
  local col = (item.byte_offset or 0) + 1
  return row, col
end

local diagnostics = h.make_builtin({
  name = "typos",
  meta = {
    url = "https://github.com/crate-ci/typos",
    description = "Source code spell checker",
  },
  method = DIAGNOSTICS,
  filetypes = filetypes,
  generator_opts = {
    command = "typos",
    args = { "--format", "json", "-" },
    to_stdin = true,
    format = "line",
    check_exit_code = function(code)
      return code == 0 or code == 2
    end,
    on_output = function(line, params)
      if not line or line == "" then
        return nil
      end

      local ok, item = pcall(vim.json.decode, line)
      if not ok or type(item) ~= "table" or item.type ~= "typo" then
        return nil
      end

      local word = item.typo
      if type(word) ~= "string" or word == "" then
        return nil
      end

      local corrections = item.corrections or {}
      local correction = corrections[1] and (" -> " .. corrections[1]) or ""
      local row, col = typo_position(item)

      return {
        row = row,
        col = col,
        end_row = row,
        end_col = col + #word,
        source = "typos",
        message = "Possible typo: " .. word .. correction,
        severity = h.diagnostics.severities["hint"],
      }
    end,
  },
  factory = h.generator_factory,
})

local code_actions = {
  name = "typos_code_actions",
  method = CODE_ACTION,
  filetypes = filetypes,
  generator = {
    fn = function(params)
      local input = table.concat(params.content, "\n")
      local output = vim.fn.system({ "typos", "--format", "json", "-" }, input)

      local code = vim.v.shell_error
      if code ~= 0 and code ~= 2 then
        return {}
      end

      local actions = {}
      local cursor_row = params.row - 1
      local cursor_col = params.col

      for line in output:gmatch("[^\r\n]+") do
        local ok, item = pcall(vim.json.decode, line)
        if ok and type(item) == "table" and item.type == "typo" then
          local word = item.typo
          local corrections = item.corrections or {}

          if type(word) == "string" and word ~= "" and not vim.tbl_isempty(corrections) then
            local row, col = typo_position(item)

            local start_row = row - 1
            local start_col = col - 1
            local end_row = start_row
            local end_col = start_col + #word

            local cursor_hits =
                cursor_row == start_row
                and cursor_col >= start_col
                and cursor_col < end_col

            if cursor_hits then
              for _, replacement in ipairs(corrections) do
                table.insert(actions, {
                  title = ("Fix typo: %s -> %s"):format(word, replacement),
                  action = function()
                    vim.lsp.util.apply_text_edits({
                      {
                        range = {
                          start = { line = start_row, character = start_col },
                          ["end"] = { line = end_row, character = end_col },
                        },
                        newText = replacement,
                      },
                    }, params.bufnr, "utf-8")
                  end,
                })
              end
            end
          end
        end
      end

      return actions
    end,
    async = false,
  },
}
return {
  diagnostics = diagnostics,
  code_actions = code_actions,
}
