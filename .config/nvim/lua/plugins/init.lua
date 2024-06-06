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
        "pyright",
      },
    },
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
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
      ---@type lc.storage
      storage = {
        home = "/home/avt/random_projects/lc/",
        cache = vim.fn.stdpath "cache" .. "/leetcode",
      },
      injector = { ---@type table<lc.lang, lc.inject>
        ["cpp"] = {
          before = { "#include <bits/stdc++.h>", "#include <vector>", "#include <string>", "using namespace std;" },
          after = "int main() {}",
        },
      },
    },
    lazy = false,
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
