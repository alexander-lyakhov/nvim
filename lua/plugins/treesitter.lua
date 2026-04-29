return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	main = "nvim-treesitter.configs",

	-- require('nvim-treesitter').setup ({
	opt =  {
		ensure_installed = {
			"lua",
			"python",
			"javascript",
			"typescript",
			"vim",
			"vimdoc",
			"sql",
			"rust",
			"json",
			"html",
			"css",
			"c",
			"c++",
		},

		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
		}
	}
}
