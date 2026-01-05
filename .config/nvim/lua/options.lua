require "nvchad.options"

-- add yours here!

local o = vim.o
o.relativenumber = true -- default is relative line number
o.scrolloff = 5         -- minimum number of lines to keep above and below the cursor
o.conceallevel = 1
o.termguicolors = true

-- Custom highlight overrides
vim.api.nvim_set_hl(0, "Visual", { bg = "#dd7878", fg = "black" })
vim.api.nvim_set_hl(0, "Substitute", { bg = "#f38ba8", fg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#89dceb" })
vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#eba0ac", fg = "#11111b" })
vim.api.nvim_set_hl(0, "CurSearch", { bg = "#f02993", fg = "#11111b" })
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#333245" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#333245" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#333245" })
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#11111b" })
vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#f9e2af" })
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#a6e3a1" })

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


vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at the last position it was edited earlier',
  pattern = '*',
  command = 'silent! normal! g`"zv'
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    if vim.bo.binary then return end
    -- check first 2000 chars for CR to avoid scanning massive files
    local ok, text = pcall(vim.api.nvim_buf_get_text, 0, 0, 0, 50, 0, {})
    if not ok then return end
    local joined = table.concat(text, "\n")
    if joined:find("\r", 1, true) then
      vim.bo.fileformat = "unix"
      vim.cmd([[silent! %s/\r//g]])
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.md",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    -- Check for frontmatter
    if #lines < 2 or lines[1] ~= "---" then return end
    local front_end
    for i = 2, #lines do
      if lines[i] == "---" then
        front_end = i
        break
      end
    end
    if not front_end then return end

    -- Prepare new modified_at line
    local new_time = os.date("%a, %d-%m-%Y %H:%M")
    local new_line = "modified_at: " .. new_time
    local modified_found = false

    -- Update existing modified_at
    for i = 2, front_end - 1 do
      if lines[i]:match("^modified_at:") then
        lines[i] = new_line
        modified_found = true
        break
      end
    end

    -- Add if missing (shouldn't happen with template)
    if not modified_found then
      table.insert(lines, front_end, new_line)
      front_end = front_end + 1 -- Adjust closing --- position
    end

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  end
})
