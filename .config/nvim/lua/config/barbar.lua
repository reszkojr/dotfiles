require("barbar").setup({
	animation = true,
	auto_hide = false,
	tabpages = false,
	clickable = true,
	icons = {
		buffer_index = true,
		buffer_number = false,
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
			[vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
		filetype = {
			enabled = true,
		},
		separator = { left = "▎", right = "" },
		modified = { button = "●" },
		pinned = { button = "", filename = true },
		close = { button = "󰅖" },
	},
})
