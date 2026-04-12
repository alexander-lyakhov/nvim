local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'phaazon/hop.nvim'
	},
	--
	-- @@@ Everforest
	--
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,

		config = function()
			require("everforest").setup({
				italics = false,
				background = "hard",
				transparent_background_level = 0,
				vim.cmd.colorscheme('everforest'),
				ui_contrast = "high",
			})
		end
	},
	--
	-- @@@ Lualine
	--
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	--
	-- @@@ NeoTree
	--
	--[[{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
	},
	--]]

	--
	-- @@@ TreeSitter
	--
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate'
	},
	--
	-- @@@ Telescope
	--
	{
		'nvim-telescope/telescope.nvim', version = '*',

		dependencies = {
			'nvim-lua/plenary.nvim',
			"BurntSushi/ripgrep",
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require('telescope').setup({
				pickers = {
					builtin = {
						theme = 'ivy'
					},
					colorscheme = {
						theme = 'ivy'
					},
					buffers = {
						theme = 'ivy'
					},
					find_files = {
						theme = 'ivy'
					},
					live_grep = {
						theme = 'ivy'
					},
					git_status = {
						theme = 'ivy'
					},
					git_commits = {
						theme = 'ivy'
					},
					git_branches = {
						theme = 'ivy'
					},
				}
			})
		end
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require('telescope').setup({
				extensions = {
					file_browser = {
						theme = 'ivy'
					},
				}
			})
		end
	},
})
