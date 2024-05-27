return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
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
      },
    },
  },

  {
    "jamestthompson3/nvim-remote-containers",
    cmd = { "AttachToContainer", "ComposeUp", "BuildImage", "StartImage" },
  },
  {
    "lspcontainers/lspcontainers.nvim",
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = { "VimBeGood" },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function()
  --     local opts = require "plugins.configs.treesitter"
  --     opts.ensure_installed = {
  --       "lua",
  --       "javascript",
  --       "typescript",
  --       "tsx",
  --     }
  --     return opts
  --   end,
  -- },
}
