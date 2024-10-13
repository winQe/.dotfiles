-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_override = {
    ["Visual"] = { bg = "#dd7878", fg = "black" },
  },
}

return M
