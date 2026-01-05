local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- Disabled global diagnostic virtual text
vim.diagnostic.config({ virtual_text = false })

-- Base config for all servers
vim.lsp.config("*", {
  on_init = on_init,
  capabilities = capabilities,
})

-- Simple servers with default config
local servers = { "html", "cssls", "eslint", "pyright", "terraformls", "sourcekit" }

for _, server in ipairs(servers) do
  vim.lsp.config(server, {})
end

vim.lsp.config("ts_ls", {
  settings = {
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayVariableTypeHints = false,
      },
    },
  },
})

vim.lsp.config("clangd", {
  filetypes = { "cpp", "c", "cxx", "h", "hpp" },
  cmd = {
    "clangd",
    "--query-driver=/usr/bin/c++,/usr/bin/g++,/usr/bin/gcc",
    "--background-index",
    "--clang-tidy",
  },
})

vim.lsp.config("rust_analyzer", {
  root_markers = { "Cargo.toml" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

-- Enable all configured servers
vim.lsp.enable(servers)
vim.lsp.enable { "ts_ls", "clangd", "rust_analyzer", "gopls" }
