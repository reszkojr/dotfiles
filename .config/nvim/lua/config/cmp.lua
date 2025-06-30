local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<Tab>"] = function(fallback)
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
            elseif cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
	},
})
