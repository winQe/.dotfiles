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
  -- Go to definition (gd)
  {
    "gd",
    function()
      return require("obsidian").util.gf_passthrough()
    end,
    expr = true,
    buffer = true,
    noremap = false,
    desc = "Obsidian Go to Definition"
  },
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
    "<cmd>ObsidianOpen<CR>",
    desc = "Open in Obsidian App"
  },
  {
    "<leader>ob",
    "<cmd>ObsidianBacklinks<CR>",
    desc = "Show Obsidian Backlinks"
  },
  {
    "<leader>ol",
    "<cmd>ObsidianLinks<CR>",
    desc = "Show Obsidian Links"
  },
  {
    "<leader>on",
    "<cmd>ObsidianNew<CR>",
    desc = "Create New Note"
  },
  {
    "<leader>os",
    "<cmd>ObsidianSearch<CR>",
    desc = "Search Obsidian"
  },
  {
    "<leader>oq",
    "<cmd>ObsidianQuickSwitch<CR>",
    desc = "Quick Switch"
  },
  {
    "<leader>op",
    "<cmd>ObsidianPasteImg<CR>",
    desc = "Paste Image"
  },
  {
    "<leader>odd",
    ":!rm '%:p'<CR>:bd<CR>",
    desc = "Delete File",
    silent = true
  }
}
