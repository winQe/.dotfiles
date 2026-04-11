local M = {}

function M.open()
  local vault = vim.fn.expand("~/ObsidianVault")
  local week_id = os.date("%Y-W%V")
  local folder = vault .. "/Periodic Notes/Weekly"
  local filepath = folder .. "/" .. week_id .. ".md"

  if vim.fn.filereadable(filepath) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(filepath))
  else
    local tmpl_path = vault .. "/Templates/WeeklyNvim.md"
    local tmpl = vim.fn.readfile(tmpl_path)
    local date_str = os.date("%a, %d-%m-%Y")
    local time_str = os.date("%H:%M")
    local lines = {}
    for _, line in ipairs(tmpl) do
      line = line:gsub("{{title}}", week_id)
      line = line:gsub("{{date}}", date_str)
      line = line:gsub("{{time}}", time_str)
      table.insert(lines, line)
    end
    vim.fn.mkdir(folder, "p")
    vim.fn.writefile(lines, filepath)
    vim.cmd("edit " .. vim.fn.fnameescape(filepath))
  end
end

return M
