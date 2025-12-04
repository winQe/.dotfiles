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
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })
map("n", "<leader>bd", function() Snacks.bufdelete.other() end, { desc = "Delete other buffers" })
map("n", "<leader>ba", function() Snacks.bufdelete.all() end, { desc = "Delete all buffers" })
map("n", "<leader>bx", function() Snacks.bufdelete() end, { desc = "Delete buffer" })

-- Smart dd: delete without yank if line is empty/whitespace
map("n", "dd", function()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*$") then
    return "\"_dd"
  else
    return "dd"
  end
end, { expr = true, noremap = true, desc = "Smart dd (skip yank on empty lines)" })

local function is_bullet(line)
  return line:match("^%s*[-*+]%s+") ~= nil or line:match("^%s*[-*+]%s*$") ~= nil
end

local function toggle_range(bufnr, s, e)
  local lines = vim.api.nvim_buf_get_lines(bufnr, s - 1, e, false)
  for i, ln in ipairs(lines) do
    if is_bullet(ln) then
      -- remove leading bullet and following space(s)
      lines[i] = ln:gsub("^%s*[-*+]%s*", "")
    else
      local indent = ln:match("^(%s*)") or ""
      local rest = ln:gsub("^%s*", "")
      lines[i] = indent .. "- " .. rest
    end
  end
  vim.api.nvim_buf_set_lines(bufnr, s - 1, e, false, lines)
end

-- Toggle for visual selection
local function toggle_bullets_visual()
  local bufnr = vim.api.nvim_get_current_buf()
  local s = vim.fn.line("'<")
  local e = vim.fn.line("'>")
  toggle_range(bufnr, s, e)
end

-- Toggle for current line
local function toggle_bullets_line()
  local bufnr = vim.api.nvim_get_current_buf()
  local l = vim.fn.line('.')
  toggle_range(bufnr, l, l)
end

-- Keymaps (adjust <leader>u if you prefer something else)
vim.keymap.set('x', '<leader>ul', toggle_bullets_visual, { silent = true, desc = "Toggle bullets" })
vim.keymap.set('n', '<leader>ul', toggle_bullets_line, { silent = true, desc = "Toggle bullets" })

-- Copy file path/directory
map("n", "<leader>yp", function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy file path" })

map("n", "<leader>yd", function()
  local dir = vim.fn.expand('%:p:h')
  vim.fn.setreg('+', dir)
  vim.notify("Copied: " .. dir)
end, { desc = "Copy file directory" })
