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
        edit = 'nvim --server "$NVIM" --remote-send "<C-\\><C-N>:close<CR>:e {{filename}}<CR>"',
        editAtLine = 'nvim --server "$NVIM" --remote-send "<C-\\><C-N>:close<CR>:e +{{line}} {{filename}}<CR>"',
        editAtLineAndWait = 'nvim --server "$NVIM" --remote-tab-wait +{{line}} {{filename}}',
        openDirInEditor = 'nvim --server "$NVIM" --remote-send "<C-\\><C-N>:close<CR>:e {{dir}}<CR>"',
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
