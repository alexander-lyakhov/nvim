return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	main = "nvim-treesitter.configs",
	dependencies = {
		'windwp/nvim-ts-autotag',
	},

	-- require('nvim-treesitter').setup ({
	opt =  {
		ensure_installed = {
			"c",
			"c++",
			"rust",
			"lua",
			"sql",
			"python",
			"javascript",
			"typescript",
			"typescriptvue",
			"vim",
			"vimdoc",
			"json",
			"html",
			"css",
			"cass",
			"scss",
		},
	
		--[[
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = '<C-space>',
				node_incremental = '<C-space>',
				node_decrimental = '<S-minus>',
				scope_incremental = false,
			}
		},
		--]]
		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
		},

		autotag = {
			enable = true
		}
	}
}
