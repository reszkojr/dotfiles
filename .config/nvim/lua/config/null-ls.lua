local none_ls = require("null-ls")
local formatting = none_ls.builtins.formatting

none_ls.setup({
  sources = {
    formatting.autopep8.with({
      command = "autopep8",
      extra_args = {
        "--max-line-length=120",
        "--ignore=E26,E265,E302,E305,E701,E501",
      },
    }),
  },
})

