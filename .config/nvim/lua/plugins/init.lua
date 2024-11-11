return {
  -- LSP and Formatting Plugins
  {
    "neovim/nvim-lspconfig",
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
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
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
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Git Integration
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
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
    "pteroctopus/faster.nvim" ,
    event = "VeryLazy",
  },

  -- Miscellaneous
  {
    "ThePrimeagen/vim-be-good",
    cmd = { "VimBeGood" },
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      { "<leader>pc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save code snapshot to clipboard" },
      { "<leader>ps", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save code snapshot to ~/Pictures" },
    },
    cmd = { "CodeSnapHighlight", "CodeSnap" },
    opts = {
      save_path = "~/Pictures",
      has_breadcrumbs = true,
      bg_theme = "grape",
      has_line_number = true,
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
}
