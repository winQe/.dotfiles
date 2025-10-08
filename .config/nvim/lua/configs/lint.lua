local lint = require "lint"

-- Configure linters by filetype
lint.linters_by_ft = {
  swift = { "swiftlint" },
}

-- Auto-lint on specific events
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

