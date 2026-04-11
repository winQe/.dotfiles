return {
  -- Only load telescope for NvChad theme picker
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>th", "<cmd>Telescope themes<cr>", desc = "Theme Picker" },
    },
  },

  -- Catppuccin with integrations for all plugins
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        blink_cmp = true,
        diffview = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mason = true,
        neogit = true,
        noice = true,
        rainbow_delimiters = true,
        treesitter_context = true,
        treesitter = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        barbecue = {
          dim_dirname = true,
          bold_basename = true,
          dim_context = false,
          alt_background = false,
        },
        which_key = true,
      },
    },
  },

  -- LSP and Formatting Plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "clangd",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "pyright",
        "rust-analyzer",
        "gopls",
        "terraform-ls",
      },
    },
  },
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets", "Kaiser-Yang/blink-cmp-avante" },
    -- use a release tag to download pre-built binaries
    version = "*",
    opts = require "configs.blink",
    opts_extend = { "sources.default" },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("inlay-hints").setup()
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
  },
  {
    "danymat/neogen",
    cmd = { "Neogen" },
    config = true,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- Treesitter and Syntax Enhancements
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    opts = require "configs.treesitter_context",
    config = function(_, opts)
      require("treesitter-context").setup(opts)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require "configs.rainbow"
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end
  },
  -- Git Integration
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup()
    end,
    lazy = false,
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "folke/snacks.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
      { "<leader>gC", "<cmd>Neogit commit<cr>", desc = "Neogit Commit" },
    },
    opts = {
      integrations = {
        diffview = true,
        snacks = true,
      },
      graph_style = "unicode",
    },
  },

  -- Productivity Enhancements
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.harpoon"
    end,
    event = "VeryLazy",
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      require "configs.multicursor"
    end,
    event = "VeryLazy",
  },
  {
    "jinh0/eyeliner.nvim",
    event = "VeryLazy",
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "uga-rosa/translate.nvim",
    event = "VeryLazy",
    config = function()
      require("translate").setup {
        default = {
          command = "google",
          output = "replace",
        },
      }
    end,
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = {},
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require "grug-far"
          local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"
          grug.open {
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          }
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    'RyanMillerC/better-vim-tmux-resizer',
    event = 'VeryLazy'
  }, {

  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  }
},
  -- {
  --   "pteroctopus/faster.nvim",
  --   event = "VeryLazy",
  -- },

  -- Miscellaneous
  {
    "ThePrimeagen/vim-be-good",
    cmd = { "VimBeGood" },
  },
  {
    "mistricky/codesnap.nvim",
    keys = {
      { "<leader>pc", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save code snapshot to clipboard" },
      { "<leader>ps", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save code snapshot to ~/Pictures" },
    },
    cmd = { "CodeSnapHighlight", "CodeSnap" },
    opts = {
      save_path = "~/Pictures",
      show_line_number = true,
      snapshot_config = {
        code_config = {
          breadcrumbs = {
            enable = true,
          },
        },
        background = {
          start = { x = 0, y = 0 },
          ["end"] = { x = "max", y = "max" },
          stops = {
            { position = 0, color = "#cba6f7" },
            { position = 1, color = "#f5c2e7" },
          },
        },
      },
    },
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = require "configs.leetcode",
    lazy = false,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = require "configs.snacks",
    keys = {
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
      {
        "<leader>lg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gb",
        function()
          Snacks.git.blame_line()
        end,
        desc = "Git Blame Line",
      },
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse()
        end,
        desc = "Git Browse",
      },
      {
        "<leader>gf",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Lazygit Current File History",
      },
      {
        "<leader>gl",
        function()
          Snacks.lazygit.log()
        end,
        desc = "Lazygit Log (cwd)",
      },
      {
        "<leader>cR",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "Rename File",
      },
      {
        "]]",
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = "Next Reference",
        mode = { "n", "t" },
      },
      {
        "[[",
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = "Prev Reference",
        mode = { "n", "t" },
      },
      -- Picker keymaps (replacing telescope)
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fa", function() Snacks.picker.files({ hidden = true, ignored = true }) end, desc = "Find All Files" },
      { "<leader>fw", function() Snacks.picker.grep() end, desc = "Live Grep" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent Files" },
      { "<leader>fz", function() Snacks.picker.lines() end, desc = "Find in Current Buffer" },
      { "<leader>ma", function() Snacks.picker.marks() end, desc = "Find Marks" },
      { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Find Keymaps" },
      { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume Last Picker" },
      { "<leader>fc", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>f/", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      -- Git pickers
      { "<leader>cm", function() Snacks.picker.git_log() end, desc = "Git Commits" },
      { "<leader>gt", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff" },
      { "<leader>gs", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gc", function() Snacks.picker.git_log_file() end, desc = "Git Log (current file)" },
      -- Word under cursor
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Search Word Under Cursor", mode = { "n", "x" } },
    },
  },
  {
    "NStefan002/speedtyper.nvim",
    lazy = false,
    branch = "v2",
  },

  -- Cursor Animation
  -- {
  --   "sphamba/smear-cursor.nvim",
  --   disable = true,
  --   event = "VeryLazy",
  --   opts = {
  --     stiffness = 0.8,
  --     trailing_stiffness = 0.7,
  --     damping = 0.95,
  --     time_interval = 17,
  --   },
  -- },
  -- UI and Notifications
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require "configs.noice"
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {},
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    event = "VeryLazy",
    opts = {
      -- configurations go here
    },
    config = function()
      require("barbecue").setup {
        create_autocmd = false, -- prevent barbecue from updating itself automatically
      }

      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        -- "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },

  {
    "obsidian-nvim/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.cmp"
    },
    opts = require "configs.obsidian",
    keys = require "keymaps.obsidian",
    config = function(_, opts)
      require("obsidian").setup(opts)

      -- Wrap the :Obsidian command to support "weekly" subcommand
      local orig = vim.api.nvim_get_commands({})["Obsidian"]
      if orig then
        local orig_fn = orig.callback
        vim.api.nvim_create_user_command("Obsidian", function(cmd_opts)
          if cmd_opts.args == "weekly" then
            require("configs.obsidian_weekly").open()
          else
            orig_fn(cmd_opts)
          end
        end, {
          nargs = orig.nargs,
          complete = function(arg_lead, cmd_line, cursor_pos)
            local completions = { "weekly" }
            -- Get original completions
            if orig.complete_arg then
              local orig_completions = orig.complete_arg(arg_lead, cmd_line, cursor_pos)
              if orig_completions then
                vim.list_extend(completions, orig_completions)
              end
            end
            return vim.tbl_filter(function(c)
              return c:find(arg_lead, 1, true) == 1
            end, completions)
          end,
          bang = orig.bang,
          desc = orig.definition,
          force = true,
        })
      end
    end,
  },
  {
    "bullets-vim/bullets.vim",
    event = "VeryLazy",
    init = function()
      -- which filetypes to enable the plugin for
      vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit", "scratch" }

      -- disable bullets in empty buffers (useful if you don't want it in new unsaved buffers)
      vim.g.bullets_enable_in_empty_buffers = 0

      -- whether bullets.vim should set its default mappings (1 = yes, 0 = no)
      -- set to 0 if you prefer to create your own keymaps
      vim.g.bullets_set_mappings = 1
    end,
    -- optional: run after load (only needed if you want to set up custom mappings that require the plugin)
    config = function()
      -- example: create a custom normal-mode mapping to toggle bullet insertion (only if you disabled default mappings)
      -- vim.api.nvim_set_keymap("n", "<leader>tb", ":call bullets#toggle()<CR>", { noremap = true, silent = true })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    ft = "markdown",
    opts = {},
  },

}
