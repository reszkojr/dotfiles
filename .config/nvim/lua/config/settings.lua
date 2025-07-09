vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.foldenable = false

vim.g.mapleader = " "

vim.o.scrolloff = 50
vim.o.undofile = true
vim.opt.undodir = vim.fn.expand('~/.nvim/undodir//')

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        require("nvim-tree.api").tree.close()
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertLeave" }, {
    pattern = "*",
    command = "silent! write",
})

