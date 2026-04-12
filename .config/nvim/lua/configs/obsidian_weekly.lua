local M = {}

--- Get the Monday of a given ISO week
---@param year number
---@param week number
---@return number timestamp of Monday 00:00
local function monday_of_week(year, week)
  -- Jan 4 is always in ISO week 1
  local jan4 = os.time({ year = year, month = 1, day = 4, hour = 0 })
  local jan4_wday = tonumber(os.date("%u", jan4)) -- 1=Mon, 7=Sun
  local week1_monday = jan4 - (jan4_wday - 1) * 86400
  return week1_monday + (week - 1) * 7 * 86400
end

--- Build daily log lines with [[YYYY-MM-DD]] links for the week
---@param year number
---@param week number
---@return string[]
local function daily_log_lines(year, week)
  local mon = monday_of_week(year, week)
  local days = { "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" }
  local lines = {}
  for i, name in ipairs(days) do
    local ts = mon + (i - 1) * 86400
    local date = os.date("%Y-%m-%d", ts)
    table.insert(lines, ("- [[%s]] %s"):format(date, name))
  end
  return lines
end

function M.open()
  local vault = vim.fn.expand("~/ObsidianVault")
  local week_id = os.date("%Y-W%V")
  local folder = vault .. "/Periodic Notes/Weekly"
  local filepath = folder .. "/" .. week_id .. ".md"

  if vim.fn.filereadable(filepath) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(filepath))
  else
    local year = tonumber(os.date("%Y"))
    local week = tonumber(os.date("%V"))

    local tmpl_path = vault .. "/Templates/WeeklyNvim.md"
    local tmpl = vim.fn.readfile(tmpl_path)
    local date_str = os.date("%a, %d-%m-%Y")
    local time_str = os.date("%H:%M")
    local daily_lines = daily_log_lines(year, week)

    local lines = {}
    for _, line in ipairs(tmpl) do
      line = line:gsub("{{title}}", week_id)
      line = line:gsub("{{date}}", date_str)
      line = line:gsub("{{time}}", time_str)

      if line:match("^## Daily Log") then
        table.insert(lines, line)
        for _, dl in ipairs(daily_lines) do
          table.insert(lines, dl)
        end
        -- Skip the placeholder lines in template (next 7 "- " lines handled by reading past them)
      elseif not line:match("^%- %a%a%a %—$") and not line:match("^%- %a%a%a$") then
        table.insert(lines, line)
      end
    end

    vim.fn.mkdir(folder, "p")
    vim.fn.writefile(lines, filepath)
    vim.cmd("edit " .. vim.fn.fnameescape(filepath))
  end
end

return M
