vim.g.ale_fixers = {
  python = { "autopep8" },
  lua = { "stylua" },
}

vim.g.ale_linters = {
  python = { "flake8" }, -- opcional
}

vim.g.ale_fix_on_save = 0

