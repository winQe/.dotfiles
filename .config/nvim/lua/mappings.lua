require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<A-o>", ":ClangdSwitchSourceHeader<cr>", { silent = false, desc = "Switch source header" })
map(
  "n",
  "<leader>dg",
  ":lua require('neogen').generate()<CR>",
  { noremap = true, silent = false, desc = "Generate docs" }
)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
