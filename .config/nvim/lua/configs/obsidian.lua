return {
  completion = {
    blink = true,
    min_chars = 0,
  },
  workspaces = {
    {
      name = "Notes",
      path = "~/ObsidianVault/",
    },
  },
  attachments = {
    img_folder = "",
  },
  templates = {
    folder = "Templates",
    date_format = "%a, %d-%m-%Y",
    time_format = "%H:%M",
  },
  daily_notes = {
    folder = "Notes/Dailies",
    template = "DailiesNvim",
  },
  ui = {
    enabled = false,
  },
  legacy_commands = false,
  -- Optional, customize how note IDs are generated given an optional title.
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'.
    -- You may have as many periods in the note ID as you'd like—the ".md" will be added automatically
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return suffix
  end,
}
