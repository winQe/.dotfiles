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
vim.api.nvim_set_hl(0, "CurSearch", { bg = "#f02993", fg = "#11111b" })
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#333245" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#333245" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#333245" })

vim.g.matchparent_timeout = 2
vim.g.matchparent_insert_timeout = 2

-- vim.cmd "Hardtime enable" -- enable Hardtime nvim
-- vim.cmd "TSContextEnable" -- enable nvim-treesitter-context
-- vim.cmd "UfoDisable"
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.api.nvim_create_autocmd("CursorMoved", {
  group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true }),
  callback = function()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function()
        vim.cmd.nohlsearch()
      end)
    end
  end,
})

vim.api.nvim_create_user_command("BufOnly", function()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, {})
