require "nvchad.options"

-- add yours here!

local o = vim.o
o.relativenumber = true -- default is relative line number
o.scrolloff = 5 -- minimum number of lines to keep above and below the cursor

vim.cmd "Hardtime enable" -- enable Hardtime nvim
-- o.cursorlineopt ='both' -- to enable cursorline!
