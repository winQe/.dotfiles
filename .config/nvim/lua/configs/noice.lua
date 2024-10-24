require("noice").setup {
  messages = { enabled = false },
  lsp = {
    signature = { enabled = false },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
      ["vim.lsp.handlers['textDocument/signatureHelp']"] = false,
    },
  },
  views = {
    cmdline_popup = {
      position = { row = 20, col = "50%" },
      size = { width = 60, height = "auto" },
    },
    popupmenu = {
      relative = "editor",
      position = { row = 8, col = "50%" },
      size = { width = 60, height = 10 },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
}
