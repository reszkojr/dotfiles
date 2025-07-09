require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "autopep8" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
})
