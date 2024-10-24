local grug = require "grug-far"
local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"
grug.open {
  transient = true,
  prefills = {
    filesFilter = ext and ext ~= "" and "*." .. ext or nil,
  },
}
