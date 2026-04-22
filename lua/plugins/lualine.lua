require('lualine').setup({
	-- options = { theme = 'gruvbox-material' },
	-- options = { theme = 'material' },
	options = { theme = 'onedark' },
	-- options = { theme = 'powerline' },
	-- options = { theme = 'tomorrow_night' },
	sections = {
		lualine_c = {
			{ 'filename', path = 1 },
		}
	}
})