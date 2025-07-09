require("html-css").setup({
    enable_on = {
        "html",
        "htmldjango",
        "tsx",
        "jsx",
        "erb",
        "svelte",
        "vue",
        "blade",
        "php",
        "templ",
        "astro",
        "typescriptreact",
    },
    filetypes = { "html", "typescriptreact", "javascriptreact" },
    notify = true,
    handlers = {
        definition = {
            bind = "gd"
        },
        hover = {
            bind = "K",
            wrap = true,
            border = "none",
            position = "cursor",
        }
    },
    documentation = {
        auto_show = true,
    },
    style_sheets = {}
})
