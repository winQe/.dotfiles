local harpoon = require "harpoon"

harpoon:setup {}

vim.keymap.set("n", "<leader>hm", function()
  harpoon:list():add()
end, { desc = "Harpoon Add", silent = false })

vim.keymap.set("n", "<leader>ht", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Quick Menu", silent = false })

vim.keymap.set("n", "<leader>hp", function()
  harpoon:list():prev()
end, { desc = "Harpoon Next", silent = false })
vim.keymap.set("n", "<leader>hn", function()
  harpoon:list():next()
end, { desc = "Harpoon Prev", silent = false })
