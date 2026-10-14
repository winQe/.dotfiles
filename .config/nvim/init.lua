-- nvim 0.12 always passes lists of nodes to query predicates/directives. nvim-treesitter's
-- archived master branch still registers handlers with `all = false` and expects a single node.
if vim.fn.has "nvim-0.12" == 1 then
  local query = vim.treesitter.query
  local function single_node(handler)
    return function(match, ...)
      local m = setmetatable({}, {
        __index = function(_, k)
          local v = match[k]
          return type(v) == "table" and v[#v] or v
        end,
      })
      return handler(m, ...)
    end
  end
  for _, name in ipairs { "add_predicate", "add_directive" } do
    local orig = query[name]
    query[name] = function(n, handler, opts)
      if type(opts) == "table" and opts.all == false then
        handler = single_node(handler)
      end
      return orig(n, handler, opts)
    end
  end
end

-- nvim 0.12's inlay hint decoration provider calls nvim_buf_set_extmark with strict extmarks, so a
-- stale hint whose column is past end-of-line throws "Invalid 'col': out of range". Clamp instead.
if vim.fn.has "nvim-0.12" == 1 then
  local inlay_ns = vim.api.nvim_create_namespace "nvim.lsp.inlayhint"
  local set_extmark = vim.api.nvim_buf_set_extmark
  vim.api.nvim_buf_set_extmark = function(buf, ns, line, col, opts)
    if ns == inlay_ns and opts and opts.strict == nil then
      opts.strict = false
    end
    return set_extmark(buf, ns, line, col, opts)
  end
end

vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "winQe/NvChad",
    lazy = false,
    branch = "remove-tel",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

function _G.LazygitEditFromHandoff()
  local path = _G.LazygitHandoffPath
  if not path then return "" end
  local fh = io.open(path, "r")
  if not fh then return "" end
  local raw = fh:read("*a")
  fh:close()
  pcall(os.remove, path)

  if raw == "" then return "" end

  local filename, line
  local line_part, name_part = raw:match("^%+(%d+)\n(.*)$")
  if line_part and name_part ~= "" and not name_part:find("\n", 1, true) then
    line = line_part
    filename = name_part
  elseif not raw:find("\n", 1, true) then
    filename = raw
  else
    return ""
  end

  pcall(vim.cmd, "close")
  vim.schedule(function()
    if line then
      vim.cmd(string.format("edit +%s %s", line, vim.fn.fnameescape(filename)))
    else
      vim.cmd("edit " .. vim.fn.fnameescape(filename))
    end
  end)
  return ""
end
