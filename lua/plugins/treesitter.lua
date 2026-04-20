require('nvim-treesitter').setup ({
	ensure_installed = { "typescript", "lua", "javascript", "rust" },

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	}
})