
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

require("core.options")
require("core.keymaps")
require("core.lazy")

-- vim.cmd.colorscheme("everforest")
vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("catppuccin-macchiato")

local opts = { noremap = true, silent = true }


--[[
vim.keymap.set("v", "<A-j>", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	local current_line_index = pos[1]
	local buf_height = vim.api.nvim_buf_line_count(0)

	local start_row = vim.api.nvim_buf_get_mark(0, '<')[1]
	local end_row   = vim.api.nvim_buf_get_mark(0, '>')[1]
	local lines     = vim.api.nvim_buf_get_lines(0, start_row, end_row, false)
	vim.api.nvim_buf_set_lines(0, start_row + 1, start_row + 1, false, lines)

end, opts)

vim.keymap.set("n", "<C-A-Up>", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	local current_line_index = pos[1]

	if current_line_index > 1 then
		local line = vim.api.nvim_get_current_line()

		vim.api.nvim_del_current_line()
		vim.api.nvim_buf_set_lines(0, current_line_index - 2, current_line_index - 2, false, {line})
		vim.api.nvim_win_set_cursor(0, {current_line_index - 1, pos[2]})
	end
end, opts)
--]]
