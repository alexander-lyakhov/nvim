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
	require("plugins.colorscheme").everforest,
	-- require("plugins.colorscheme").onedark,
	-- require("plugins.colorscheme").nord,

	require("plugins.neotree"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.autopairs"),
	require("plugins.gitsigns"),
	require("plugins.comments"),
	require("plugins.aerial"),
	-- require("plugins.mason"),

	--]]
	--
	-- @@@ TreeSitter
	--
	--[[
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
	},
	--]]
	
	--
	-- @@@ Telescope
	--
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
		"nvim-mini/mini.icons"
	}
})
