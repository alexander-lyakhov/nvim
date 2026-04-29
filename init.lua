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
require("plugins.lsp")

-- @@@ Telescope Git keymaps
vim.keymap.set('n', '<leader>gs', ":Telescope git_status<CR>")
vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>")
vim.keymap.set('n', '<A-g>b', ":Telescope git_branches<CR>")
vim.keymap.set('n', '<A-g>s', ":Telescope git_status<CR>")
vim.keymap.set('n', '<A-g>c', ":Telescope git_commits<CR>")
