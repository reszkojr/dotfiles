require('colorizer').setup({
    '*',                      -- Highlight all files, but customize some others.
    css = { rgb_fn = true },  -- Enable parsing rgb(...) functions in css.
    html = { names = false }, -- Disable parsing "names" in html.
}, {
    mode = 'background',      -- Set the background mode to 'background'.
})
