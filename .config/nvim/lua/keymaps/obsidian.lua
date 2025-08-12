return {
  -- Smart action (enter key)
  {
    "<CR>",
    function()
      return require("obsidian").util.smart_action()
    end,
    expr = true,
    buffer = true,
    desc = "Obsidian Smart Action"
  },
  -- -- Go to definition (gd)
  -- {
  --   "gd",
  --   function()
  --     return require("obsidian").util.gf_passthrough()
  --   end,
  --   expr = true,
  --   buffer = true,
  --   noremap = false,
  --   desc = "Obsidian Go to Definition"
  -- },
  -- Your custom keymaps
  {
    "<leader>oc",
    function()
      return require("obsidian").util.toggle_checkbox()
    end,
    desc = "Obsidian Toggle Checkbox"
  },
  {
    "<leader>oo",
    "<cmd>Obsidian open>",
    desc = "Open in Obsidian App"
  },
  {
    "<leader>ob",
    "<cmd>Obsidian backlinks<CR>",
    desc = "Show Obsidian Backlinks"
  },
  {
    "<leader>ol",
    "<cmd>Obsidian links<CR>",
    desc = "Show Obsidian Links"
  },
  {
    "<leader>on",
    "<cmd>Obsidian new<CR>",
    desc = "Create New Note"
  },
  {
    "<leader>ot",
    "<cmd>Obsidian new_from_template<CR>",
    desc = "Create New Note From Template"
  },
  {
    "<leader>os",
    "<cmd>Obsidian search<CR>",
    desc = "Search Obsidian"
  },
  {
    "<leader>oq",
    "<cmd>Obsidian quick_switch<CR>",
    desc = "Quick Switch"
  },
  {
    "<leader>op",
    "<cmd>Obsidian paste_img<CR>",
    desc = "Paste Image"
  },
  {
    "<leader>odd",
    ":!rm '%:p'<CR>:bd<CR>",
    desc = "Delete File",
    silent = true
  },
  {
    "gd",
    "<cmd>Obsidian follow_link<CR>",
    desc = "Go to Definition",
  }
}
