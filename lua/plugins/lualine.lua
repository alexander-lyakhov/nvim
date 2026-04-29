return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	config = function()
		require('lualine').setup({
			-- options = { theme = 'gruvbox-material' },
			-- options = { theme = 'material' },
			options = {
				theme = 'everforest'
				-- theme = 'auto'
			},
			-- options = { theme = 'powerline' },
			-- options = { theme = 'tomorrow_night' },
			sections = {
				lualine_c = {
					{ 'filename', path = 1 },
				}
			}
		})
	end
}