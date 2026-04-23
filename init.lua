require("core.options")
require("core.keymaps")

-- bootstrap lazy.nvim, LazyVim and your plugins
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

require("config.lazy")
require("config.keymaps")

-- require("plugins.neotree")
require("everforest").load()
-- require("nord").load()
require("plugins.lualine")
-- require("plugins.cmp")
require("plugins.treesitter")
require("plugins.lsp")

-- @@@ Telescope keymaps
local builtin = require('telescope.builtin')
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

vim.keymap.set('n', '<A-b>', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<A-/>', function() builtin.live_grep { search_dirs = { vim.fn.expand("%:p")}} end )
vim.keymap.set("n", "<A-*>", live_grep_args_shortcuts.grep_word_under_cursor_current_buffer)
vim.keymap.set("n", "<F7>", builtin.live_grep)
vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<A-/>', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<A-*>', "yiw :Telescope live_grep<CR><C-r>+", { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>ss', live_grep_args_shortcuts.grep_word_under_cursor)

vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>tc', ":Telescope colorscheme<CR>", { desc = 'Telescope colorscheme' })
vim.keymap.set('n', '<leader>tr', ":Telescope registers<CR>", { desc = 'Telescope registers' })
vim.keymap.set("n", "<A-0>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<A-\\>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
-- vim.keymap.set('n', '<A-0>', ":Telescope file_browser<CR>", { desc = 'Telescope file browser' })

-- @@@ Telescope Git keymaps
vim.keymap.set('n', '<leader>gs', ":Telescope git_status<CR>")
vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>")
vim.keymap.set('n', '<A-g>b', ":Telescope git_branches<CR>")
vim.keymap.set('n', '<A-g>s', ":Telescope git_status<CR>")
vim.keymap.set('n', '<A-g>c', ":Telescope git_commits<CR>")
