-- Importing rainbow delimiters and setting up
local rainbow_delimiters = require "rainbow-delimiters"

require("rainbow-delimiters.setup").setup {
  strategy = {
    [""] = rainbow_delimiters.strategy["global"],
    commonlisp = rainbow_delimiters.strategy["local"],
  },
  query = {
    [""] = "rainbow-delimiters",
    lua = "rainbow-blocks",
    html = "rainbow-parens",
    tsx = "rainbow-parens",
  },
  highlight = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
  },
  -- blacklist = { 'c', 'cpp' },
}

local highlight = {
  "RainbowBlue",
  "RainbowViolet",
  "RainbowCyan",
  "RainbowOrange",
  "RainbowRed",
  "RainbowYellow",
  "RainbowGreen",
}
local hooks = require "ibl.hooks"

-- Define Catppuccin Mocha colors for each delimiter
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F38BA8" }) -- Catppuccin Mocha Red
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F9E2AF" }) -- Catppuccin Mocha Yellow
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89B4FA" }) -- Catppuccin Mocha Blue
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FAB387" }) -- Catppuccin Mocha Peach
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A6E3A1" }) -- Catppuccin Mocha Green
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#CBA6F7" }) -- Catppuccin Mocha Lavender
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#94E2D5" }) -- Catppuccin Mocha Teal
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight }, indent = {char = '▏'} }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
