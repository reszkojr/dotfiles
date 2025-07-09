require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "html", "css", "javascript", "typescript", "tsx" },
    highlight = { enable = true },
})
