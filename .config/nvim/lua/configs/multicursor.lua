local mc = require "multicursor-nvim"

mc.setup()

-- Add cursors above/below the main cursor.
vim.keymap.set({ "n", "v" }, "<c-up>", function()
  mc.addCursor "k"
end, { desc = "Add cursor above" })

vim.keymap.set({ "n", "v" }, "<c-down>", function()
  mc.addCursor "j"
end, { desc = "Add cursor below" })

-- Add a cursor and jump to the next word under cursor.
vim.keymap.set({ "n", "v" }, "<leader>v", function()
  mc.addCursor "*"
end, { desc = "Add a cursor and jump to next word under cursor" })

-- -- Jump to the next word under cursor but do not add a cursor.
-- vim.keymap.set({ "n", "v" }, "<leader>vn", function()
--   mc.skipCursor "*"
-- end, { desc = "Jump to next word under cursor" })
--
-- Rotate the main cursor.
vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

-- Add and remove cursors with control + left click.
vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

vim.keymap.set({ "n", "v" }, "<c-q>", function()
  if mc.cursorsEnabled() then
    -- Stop other cursors from moving.
    -- This allows you to reposition the main cursor.
    mc.disableCursors()
  else
    mc.addCursor()
  end
end)

vim.keymap.set("n", "<esc>", function()
  if not mc.cursorsEnabled() then
    mc.enableCursors()
  elseif mc.hasCursors() then
    mc.clearCursors()
  else
    -- Default <esc> handler.
  end
end)

-- Split visual selections by regex.
vim.keymap.set("v", "S", mc.splitCursors)

-- Append/insert for each line of visual selections.
vim.keymap.set("v", "I", mc.insertVisual)
vim.keymap.set("v", "A", mc.appendVisual)
