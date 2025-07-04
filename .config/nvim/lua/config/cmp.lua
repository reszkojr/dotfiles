local cmp = require("cmp")
local mapping = require("cmp.config.mapping")
local keymap = require("cmp.utils.keymap")
local misc = require("cmp.utils.misc")

local function merge_keymaps(base, override)
  local normalized_base = {}
  for k, v in pairs(base) do
    normalized_base[keymap.normalize(k)] = v
  end

  local normalized_override = {}
  for k, v in pairs(override) do
    normalized_override[keymap.normalize(k)] = v
  end

  return misc.merge(normalized_base, normalized_override)
end

cmp.setup({
    formatting = {
        format = function(entry, vim_item)
            if entry.source.name == "html-css" then
                vim_item.menu = "[" .. (entry.completion_item.provider or "html-css") .. "]"
            end
            return vim_item
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

mapping.preset.insert = function(override)
  return merge_keymaps(override or {}, {
    ['<C-p>'] = cmp.mapping.scroll_docs(-4),
    ['<C-n>'] = cmp.mapping.scroll_docs(4),
    ['<C-f>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
})
end
