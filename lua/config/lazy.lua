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
	-- require("plugins.colorscheme").ayu,

	require("plugins.neotree"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),

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
					diagnostics = {
						theme = 'ivy'
						-- theme = 'dropdown'
					},
					registers = {
						theme = 'ivy'
					},
					buffers = {
						theme = 'ivy'
					},
					find_files = {
						file_ignore_patterns = {'node_modules', '.git'},
						theme = 'ivy',
					},
					live_grep = {
						-- theme = 'dropdown',
						file_ignore_patterns = {'node_modules', '.git'},
						theme = 'ivy',
						previewer = false,
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

			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp tags' })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sb', builtin.builtin, { desc = '[S]earch [S]elect' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
			vim.keymap.set('n', '<leader>sc', builtin.colorscheme, { desc = '[S]earch [C]olorschemes' })
			vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[S]earch [B]uffers' })

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
		"nvim-mini/mini.icons"
	}
})
