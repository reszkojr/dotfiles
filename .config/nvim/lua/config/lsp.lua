local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local mason = require("mason")

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "pylsp", "lua_ls", "cssls", "html", "ts_ls", "tailwindcss" },
    automatic_enable = {
        exclude = { "pylsp" },
    },
})

lspconfig.pylsp.setup({
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
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "require" },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

lspconfig.html.setup({
    filetypes = { "html", "htmldjango", "blade", "erb", "vue", "svelte", "astro" },
})

lspconfig.cssls.setup({
    filetypes = { "css", "scss", "less", "html", "vue", "svelte", "astro" },
})

lspconfig.ts_ls.setup({
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
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
        '-configuration', vim.fn.glob(vim.fn.stdpath('data') .. '/mason/packages/jdtls/config_linux'),
        '-data', vim.fn.stdpath('data') .. '/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),
    },
    root_dir = lspconfig.util.root_pattern('pom.xml', 'build.gradle', '.git'),
    settings = {
        java = {
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
}

lspconfig.tailwindcss.setup({
    filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "astro", "php" },
})
