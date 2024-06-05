require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<A-o>", ":ClangdSwitchSourceHeader<cr>", { silent = false, desc = "Switch Source Header" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
