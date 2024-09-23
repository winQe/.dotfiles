require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<A-o>", ":ClangdSwitchSourceHeader<cr>", { silent = false, desc = "Switch source header" })
map(
  "n",
  "<leader>dg",
  ":lua require('neogen').generate()<CR>",
  { noremap = true, silent = false, desc = "Generate docs" }
)

-- vim visual multi
map("n", "<C-x>", "<Plug>(VM-Find-Under)")
map("n", "<C-x>", "<Plug>(VM-Find-Subword-Under)")
map("n", "<M-u>", "<Plug>(VM-Select-Cursor-Up)")
map("n", "<M-d>", "<Plug>(VM-Select-Cursor-Down)")
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
