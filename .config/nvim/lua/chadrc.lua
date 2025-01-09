-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_override = {
    ["Visual"] = { bg = "#dd7878", fg = "black" },
    ["Substitute"] = { bg = "#f38ba8", fg = "#1e1e2e" },
    ["NoiceCmdlinePopupBorder"] = { fg = "#89dceb" },
    ["FlashLabel"] = { bg = "#eba0ac", fg = "#11111b" },
    ["CurSearch"] = { bg = "#f02993", fg = "#11111b" },
    ["IlluminatedWordText"] = { bg = "#333245" },
    ["IlluminatedWordRead"] = { bg = "#333245" },
    ["IlluminatedWordWrite"] = { bg = "#333245" },
  },
}

return M
