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

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
      .new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table {
          results = file_paths,
        },
        previewer = conf.file_previewer {},
        sorter = conf.generic_sorter {},
      })
      :find()
end

vim.keymap.set("n", "<leader>fh", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
