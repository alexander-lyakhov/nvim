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
	-- Colorschemes
	-- https://vimcolorschemes.com/i/trending
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
				vim.cmd.colorscheme('everforest'),
				italics = false,
				background = "hard",
				transparent_background_level = 0,
				ui_contrast = "high",

				colours_override = function (palette)
					-- palette.bg4 = palette.fg
					palette.bg4 = palette.statusline1
					-- palette.bg4 = palette.grey0

				end,
			})
		end
	},

	{
		"Luxed/ayu-vim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme ayu")
			vim.g.ayucolor = "mirage"
		end,
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
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make'
			},
			{
				"nvim-telescope/telescope-live-grep-args.nvim" ,
				version = "^1.0.0",
			}
		},
		config = function()
			local telescope = require("telescope")
			
			telescope.setup({
				pickers = {
					builtin = {
						theme = 'ivy'
					},
					colorscheme = {
						theme = 'ivy'
					},
					registers = {
						theme = 'ivy'
					},
					buffers = {
						theme = 'ivy'
					},
					find_files = {
						theme = 'ivy'
					},
					live_grep = {
						-- theme = 'dropdown',
						theme = 'ivy',
						previewer = false
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
				},
			})

			telescope.load_extension("live_grep_args")
		end
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require('telescope').setup({
				extensions = {
					file_browser = {
						theme = 'ivy',
						grouped = true,
					},
				}
			})
		end
	},
})
