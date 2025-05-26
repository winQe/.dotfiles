require "nvchad.mappings"

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<A-o>", ":ClangdSwitchSourceHeader<cr>", { silent = false, desc = "Switch source header" })
map(
  "n",
  "<leader>dg",
  ":lua require('neogen').generate()<CR>",
  { noremap = true, silent = false, desc = "Generate docs" }
)
map({ "n", "v" }, "<leader>te", ":Translate EN<CR>", { silent = true, desc = "Translate to EN" })
map("n",  "<leader>bd", ":BufOnly<CR>", { desc = "Close all other buffers" })

-- Smart dd: delete without yank if line is empty/whitespace
map("n", "dd", function()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*$") then
    return "\"_dd"
  else
    return "dd"
  end
end, { expr = true, noremap = true, desc = "Smart dd (skip yank on empty lines)" })
