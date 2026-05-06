return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	main = "nvim-treesitter.configs",

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

		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
		}
	}
}
