-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_override = {
    ["Visual"] = { bg = "#dd7878", fg = "black" },
    ["Substitute"] = { bg = "#f38ba8", fg = "#1e1e2e" },
  },
}

return M
