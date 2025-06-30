local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pylsp", "lua_ls" },
	automatic_enable = {
		exclude = { "pylsp" },
	},
})

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end


lspconfig.pylsp.setup({
    on_attach = on_attach,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "E501" },
					maxLineLength = 320,
				},
			},
		},
	},
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "require" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},

})


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local language_servers = vim.lsp.get_clients()
for _, ls in ipairs(language_servers) do
    lspconfig[ls].setup({
        capabilities = capabilities
    })
end
