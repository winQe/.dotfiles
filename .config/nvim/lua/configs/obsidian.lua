return {
  completion = {
    blink = true,
  },
  workspaces = {
    {
      name = "Notes",
      path = "~/ObsidianVault/",
    },
  },
  attachments = {
    img_folder = "Attachments",
  },
  mappings = {
    ["<cr>"] = {
      action = function()
        return require("obsidian").util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    },
    ["gd"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },
  ui = {
    enabled = false,
  },
}
