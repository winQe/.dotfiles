local options = {
  formatters_by_ft = {
    lua = { "luaformatter" },
    cpp = { "clang-format" },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
  },

  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
}

require("conform").setup(options)

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.keymap.set({ "v" }, "<leader>fm", function()
  local mode = vim.api.nvim_get_mode().mode
  local range = nil

  if vim.startswith(string.lower(mode), "v") then
    -- Get the start and end of the visual selection
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    local end_line_content = vim.api.nvim_buf_get_lines(0, end_line - 1, end_line, true)[1]

    range = {
      start = { start_line - 1, 0 },
        ["end"] = { end_line - 1, #end_line_content },
    }
  end

  require("conform").format({
    async = true,
    lsp_format = "fallback",
    range = range
  }, function(err)
    if not err then
      -- Exit visual mode if we were in visual mode
      if vim.startswith(string.lower(mode), "v") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      end
    end
  end)
end, { desc = "Format code (supports range in visual mode)" })
