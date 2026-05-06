return {
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = {
		open_mapping = [[<A-0>]],
		direction = "float",
		-- direction = "horizontal",
		-- direction = "tab",

		float_opts = {
			border = "single",
		},
		highlights = {
			--[[
			FloatBorder = {
				guifg = "#e0e0e0",
				guibg = "#000000",
			},
			--]]
			Normal = {
				guifg = "#e0e0e0",
				guibg = "#000000",
			},
			NormalFloat = {
				guifg = "#e0e0e0",
				guibg = "#000000",
			},
		},
	}
}