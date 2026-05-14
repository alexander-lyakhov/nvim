require("lazy").setup({
	-- 
	-- Colorschemes
	-- https://vimcolorschemes.com/i/trending
	--
	-- @@@ Everforest
	--
	require("plugins.colorscheme").everforest,
	require("plugins.colorscheme").onedark,
	require("plugins.colorscheme").nord,
	require("plugins.colorscheme").catppuccin,

	require("plugins.neotree"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.gitsigns"),
	require("plugins.comments"),
	require("plugins.aerial"),
	require("plugins.lsp"),
	require("plugins.blink"),
	require("plugins.toggleterm"),
	
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
	
	--
	-- @@@ MiniIcons
	--
	{
		"nvim-mini/mini.icons"
	},
	
	--
	-- @@@ Which Key
	--
	{
		-- Hints keybinds
		'folke/which-key.nvim',
		opts = {
			delay = 500,
			win = {
				border = {
					{ '┌', 'FloatBorder' },
					{ '─', 'FloatBorder' },
					{ '┐', 'FloatBorder' },
					{ '│', 'FloatBorder' },
					{ '┘', 'FloatBorder' },
					{ '─', 'FloatBorder' },
					{ '└', 'FloatBorder' },
					{ '│', 'FloatBorder' },
				},
			},
		},
	},

	--
	-- @@@ Bqf
	--
	{
		'kevinhwang91/nvim-bqf',
	},

	--
	-- @@@ Autopairs
	--
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		opts = {},
	},

	--
	-- @@@ Split maximizer
	--
	{
		'szw/vim-maximizer',
		keys = {
			{ '<leader>mm', '<cmd>MaximizerToggle<CR>', desc = '[M]aximize / [M]inimize a split'},
		}
	}
})
