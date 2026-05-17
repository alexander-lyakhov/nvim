return {
	-- @@@ everforest
	everforest = {
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,

		config = function()
			require("everforest").setup({
				vim.cmd.colorscheme('everforest'),
				italics = false,
				background = 'hard',
				transparent_background_level = 0,
				ui_contrast = "high",

				colours_override = function (palette)
					-- palette.bg4 = palette.fg
					palette.bg4 = palette.statusline1
					-- palette.bg4 = palette.grey0
				end,
				
			})
			require("everforest").load()
		end
	},

	-- @@@ onedark
	onedark = {
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('onedark').setup({
				style = 'warm'
			})
			require("onedark").load()
		end
	},

	-- @@@ nord
	nord = {
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Example config in lua
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.g.nord_disable_background = false
			-- vim.g.nord_disable_background = true
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = false

			-- Load the colorscheme
			require('nord').set()
		end
	},

	-- @@@ catppuccin
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
		end
	},
}
