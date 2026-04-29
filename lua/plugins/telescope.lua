return {
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
					grep_string = {
						theme = 'ivy',
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
			local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

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

			vim.keymap.set("n", "<A-*>", function() builtin.grep_string { search_dirs = { vim.fn.expand("%:p")}} end)
			vim.keymap.set('n', '<A-/>', function() builtin.live_grep { search_dirs = { vim.fn.expand("%:p")}} end )
			vim.keymap.set('n', '<A-b>', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set("n", "<F7>", builtin.live_grep)
			vim.keymap.set("n", "<A-\\>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>tc', ":Telescope colorscheme<CR>", { desc = 'Telescope colorscheme' })
			vim.keymap.set('n', '<leader>tr', ":Telescope registers<CR>", { desc = 'Telescope registers' })

			-- @@@ Telescope Git keymaps
			vim.keymap.set('n', '<leader>gs', ":Telescope git_status<CR>")
			vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>")
			vim.keymap.set('n', '<A-g>b', ":Telescope git_branches<CR>")
			vim.keymap.set('n', '<A-g>s', ":Telescope git_status<CR>")
			vim.keymap.set('n', '<A-g>c', ":Telescope git_commits<CR>")

			telescope.load_extension("live_grep_args")
		end
	}
}