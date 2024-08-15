require "nvchad.options"

-- add yours here!

local o = vim.o
o.relativenumber = true -- default is relative line number
o.scrolloff = 5 -- minimum number of lines to keep above and below the cursor
o.conceallevel = 1
o.termguicolors = true

-- Set colors for extensions
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#89dceb" })
vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#eba0ac", fg = "#11111b" })

vim.cmd "Hardtime enable" -- enable Hardtime nvim
-- vim.cmd "TSContextEnable" -- enable nvim-treesitter-context
-- vim.cmd "UfoDisable"
-- o.cursorlineopt ='both' -- to enable cursorline!
