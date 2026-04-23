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
		build = ':TSUpdate',
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

	--
	-- @@@ LSP
	--
	
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"hrsh7th/cmp-path",
	},
	{
		"neovim/nvim-lspconfig",
	},
	
	{
		"hrsh7th/nvim-cmp",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-cmdline",
	},
	
	
	{
		'saghen/blink.cmp',
		dependencies = {'rafamadriz/friendly-snippets'},
		version = '1.*',
		opts = {
			source = {
				default = {'lsp', 'path', 'snippets', 'buffer', 'cmdline'},
			},
			keymap = { preset = 'enter' },
			completion = {
				menu = {
					draw = {
						columns = { { 'item_idx' }, { 'label', 'label_description', gap = 1 } },
						components = {
							item_idx = {
								text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx) end,
								highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
							}
						}
					}
				},
				documentation = { auto_show = true}
			},
		},
	},
	

	{
		"vxpm/ferris.nvim",
		opts = {},
		config = function()
			local expand_macro = require("ferris.methods.expand_macro")
			local view_memory_layout = require("ferris.methods.view_memory_layout")
			vim.keymap.set("n", "<leader>em", expand_macro)
			vim.keymap.set("n", "<leader>me", view_memory_layout)
		end
	},

	--
	-- @@@ Mason
	--
	{
		"mason-org/mason.nvim",
		opts = {}
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = {}
	}
})
