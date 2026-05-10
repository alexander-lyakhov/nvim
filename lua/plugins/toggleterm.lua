
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=horizontal<CR>", opts)
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=64<CR>", opts)
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opts)
vim.keymap.set("n", "<leader>tw", ":ToggleTerm direction=tab<CR>", opts)

return {
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = {
		open_mapping = [[<A-0>]],
		autochdir = true,
		-- direction = "float",
		-- direction = "horizontal",
		direction = "tab",
		shading_factor = -50,
		shading_ratio = -5,

		float_opts = {
			border = "single",
			winblend = 25,
		},
		
		highlights = {
			--[[	
			FloatBorder = {
				guifg = "#e0e0e0",
				guibg = "#000000",
			},
			
			Normal = {
				guifg = "#e0e0e0",
				guibg = "#000000",
			},
			--]]
			NormalFloat = {
				-- guifg = "#e0e0e0",
				guibg = "#000000",
			},
		},
		
	}
}