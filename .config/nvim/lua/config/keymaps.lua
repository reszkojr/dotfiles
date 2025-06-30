local map = vim.keymap.set
local opts = { silent = true }

-- shows diagnostics for current line
map("n", "<leader><Enter>", vim.diagnostic.open_float)

-- navigate to the next/previous diagnostic
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

-- shows all diagnostics in the current buffer
map("n", "<leader>q", vim.diagnostic.setloclist)

-- cancels search highlighting
map("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- autopep8 formatter
-- map("v", "<leader>f", ":'<,'>ALEFix<CR>", { desc = "Formatar seleção com ALE" })
-- map("n", "<leader>f", ":ALEFix<CR>", { desc = "Formatar com autopep8 (ALE)" })

-- formatter
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Formatar com Conform" })

vim.keymap.set("v", "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_fallback = true,
		range = {
			start = vim.api.nvim_buf_get_mark(0, "<"),
			["end"] = vim.api.nvim_buf_get_mark(0, ">"),
		},
	})
end, { desc = "Format using Conform" })

-- Telescope
local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Search text" })
map("n", "<leader>fb", builtin.buffers, { desc = "Search open files" })
map("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File browser" })
map("n", "<leader>fp", builtin.oldfiles, { desc = "Recent files (global)" })

-- Git
map("n", "<leader>gr", require("gitsigns").reset_hunk, { desc = "Reset hunk" })
map("v", "<leader>gr", function()
	require("gitsigns").reset_hunk({ vim.fn.line("v"), vim.fn.line(".") })
end, { desc = "Reset selected lines" })
map("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
map("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- navigate between splits
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- barbar (tabs)

-- Navigate between buffers
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Re-order buffers
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Go to buffer in position 1-9, or last
for i = 1, 9 do
	map("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", opts)
end
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin or unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Sync yank with system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- Close or restore buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
map("n", "<A-s-c>", "<Cmd>BufferRestore<CR>", opts) -- May not work on all terminals

-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
map("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", opts)

-- Sort buffers automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Terminal
map("n", "<leader>vt", [[<cmd>vsplit | term<cr>A]], { desc = "Open terminal in vertical split" })
map(
	"n",
	"<leader>ht",
	[[<cmd>belowright split | resize 12 | term<cr>A]],
	{ desc = "Open terminal in horizontal split" }
)
map("n", "<leader>t", [[<cmd>belowright split | resize 12 | term<cr>A]], { desc = "Open terminal in horizontal split" })
map("t", "jk", "<C-\\><C-n>", { desc = "Use jk to enter in terminal normal mode" })

-- Debugger
-- Launch and Reset (using functions)
map("n", "<F4>", function()
	vim.fn["vimspector#Continue"]()
end, { noremap = true, silent = true, desc = "Continue Vimspector" })
map("n", "<F5>", function()
	vim.fn["vimspector#Launch"]()
end, { noremap = true, silent = true, desc = "Start Vimspector" })
map("n", "<F6>", function()
	vim.fn["vimspector#Reset"]()
end, { noremap = true, silent = true, desc = "Restart Vimspector" })

-- Step commands (using <Plug>)
map("n", "<F7>", "<Plug>VimspectorStepOver", { noremap = false, silent = true, desc = "Step over in Vimspector" })
map(
	"n",
	"<F9>",
	"<Plug>VimspectorToggleBreakpoint",
	{ noremap = false, silent = true, desc = "Toggle breakpoint in Vimspector" }
)
map("n", "<F10>", "<Plug>VimspectorStepInto", { noremap = false, silent = true, desc = "Step into in Vimspector" })
map("n", "<F11>", "<Plug>VimspectorStepOut", { noremap = false, silent = true, desc = "Step out in Vimspector" })
map("n", "<F12>", "<Plug>VimspectorStop", { noremap = false, silent = true, desc = "Stop Vimspector" })

-- Toggle Vimspector UI
map("n", "<F14>", "<Plug>VimspectorBalloonEval", { noremap = false, silent = true, desc = "Toggle Vimspector UI" })

-- folding
-- map('n', 'zR', require('ufo').openAllFolds)
-- map('n', 'zM', require('ufo').closeAllFolds)
