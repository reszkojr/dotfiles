local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.setup({})
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        {
            name = 'lazydev',
            group_index = 0
        },
        { name = 'nvim_lsp' },
        { name = 'html-css' },
        { name = 'tailwind-tools' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    formatting = {
        format = function(entry, vim_item)
            if entry.source.name == "html-css" then
                vim_item.menu = "[" .. (entry.completion_item.provider or "html-css") .. "]"
            end
            return vim_item
        end
    },
    mapping = cmp.mapping.preset.insert {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                local copilot_suggestion = vim.fn["copilot#GetDisplayedSuggestion"]()

                if copilot_suggestion.text ~= "" then
                    vim.api.nvim_feedkeys(vim.fn["copilot#Accept"](), "i", true)
                else
                    cmp.select_next_item()
                end
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<Enter>'] = cmp.mapping.confirm { select = true },
        ['<C-f>'] = cmp.mapping.complete {},
        ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { 'i', 's' }),
    },
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
