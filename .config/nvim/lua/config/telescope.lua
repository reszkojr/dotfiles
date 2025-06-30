local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--glob=!*.po",
			"--glob=!*.patch",
		},
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		mappings = {
			i = {
				["<CR>"] = actions.select_default,
			},
			n = {
				["<CR>"] = actions.select_default,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

-- Carrega extensões
telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")
