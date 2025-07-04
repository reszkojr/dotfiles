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

lspconfig.jdtls.setup {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1G',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.util.concurrent=ALL-UNNAMED',
        '-jar', vim.fn.glob(vim.fn.stdpath('data') .. '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', vim.fn.glob(vim.fn.stdpath('data') .. '/mason/packages/jdtls/config_linux'),     -- ou config_mac, config_win
        '-data', vim.fn.stdpath('data') .. '/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'), -- Diretório de dados do projeto
    },
    root_dir = lspconfig.util.root_pattern('pom.xml', 'build.gradle', '.git'),
    settings = {
        java = {
            -- Habilita o autocomplete de importações
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.nonNull",
                    "org.mockito.Mockito.*"
                },
                importOrder = {
                    "#", "java", "javax", "org", "com"
                }
            },
            inlayHints = {
                parameterNames = {
                    enabled = true,
                },
            },
            references = {
                includeDecompiledSources = true,
            },
            signatureHelp = {
                enabled = true,
            },
            contentProvider = {
                preferred = 'jdt'
            },
        }
    },
    capabilities = capabilities,
}


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
