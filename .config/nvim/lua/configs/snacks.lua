local server = vim.v.servername or ""
local handoff = vim.fn.stdpath("cache") .. "/lazygit-handoff-" .. vim.fn.sha256(server):sub(1, 8)
_G.LazygitHandoffPath = handoff
local handoff_quoted = vim.fn.shellescape(handoff)
local notify = 'nvim --server "$NVIM" --remote-expr \'v:lua.LazygitEditFromHandoff()\''

return {
  bigfile = { enabled = true },
  bufdelete = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  words = { enabled = true },
  input = { enabled = true },
  gh = {},
  lazygit = {
    config = {
      os = {
        edit = "printf '%s' {{filename}} > " .. handoff_quoted .. " && " .. notify,
        editAtLine = "printf '+%s\\n%s' {{line}} {{filename}} > " .. handoff_quoted .. " && " .. notify,
        editAtLineAndWait = 'nvim --server "$NVIM" --remote-tab-wait +{{line}} {{filename}}',
      },
    },
  },
  picker = {
    enabled = true,
    sources = {
      files = {
        frecency = true,
        hidden = true,
        exclude = {
          "CHANGELOGS",
          "*.png",
          "*.jpg",
          "*.jpeg",
          "*.gif",
          "*.bmp",
          "*.ico",
          "*.webp",
          "*.svg",
        },
      },
    },
  },
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      {
        pane = 2,
        icon = " ",
        title = "Git Status",
        section = "terminal",
        cmd = "hub status --short --branch --renames",
        height = 5,
        padding = 1,
        ttl = 5 * 60,
        indent = 3,
      },
      { section = "startup" },
    },
  },
  image = {
    resolve = function(path, src)
      if require("obsidian.api").path_is_note(path) then
        return require("obsidian.api").resolve_image_path(src)
      end
    end,
  },
}
