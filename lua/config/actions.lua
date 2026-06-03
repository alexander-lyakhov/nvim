local opts = { noremap = true, silent = true }

--
-- @@@ Replace 4 spaces with 1 tab
--
vim.keymap.set("n", "<S-Tab>", function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	for i, line in ipairs(lines) do
		local left   = line:match("^%s*")
		local right  = line:match("%S.*") or ''

		if left:match('    ') then
			lines[i] = left:gsub('    ', '\t') .. right
		end
	end

	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end, opts)

--
-- @@@ Replace tab with 2 spaces
--
vim.keymap.set("n", "<A-+>",  function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	for i, line in ipairs(lines) do
		local indent = line:match("^( +)")
		if indent then
			local tabs = string.rep("\t", math.floor(#indent / 2))
			local rest = line:sub(#indent + 1)
			local leftover = string.rep(" ", #indent % 2)
			lines[i] = tabs .. leftover .. rest
		end
	end

	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end, opts)

--
-- @@@ Replace 2 spaces with tab
--
vim.keymap.set("n", "<A-->",  function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	for i, line in ipairs(lines) do
		local indent = line:match("^\t+")
		if indent then
			local spaces = string.rep("  ", #indent)
			lines[i] = spaces .. line:sub(#indent + 1)
		end
	end

	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end, opts)

--
-- @@@ Move current line down
--
vim.keymap.set("n", "<C-A-Down>", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	local current_line_index = pos[1]
	local buf_height = vim.api.nvim_buf_line_count(0)

	if current_line_index < buf_height  then
		local line = vim.api.nvim_get_current_line()

		vim.api.nvim_del_current_line()
		vim.api.nvim_buf_set_lines(0, current_line_index, current_line_index, false, {line})
		vim.api.nvim_win_set_cursor(0, {current_line_index + 1, pos[2]})
	end
end, opts)

--
-- @@@ Move current line up
--
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

--
-- @@@ Duplicate current line
--
vim.keymap.set("n", "<A-S-d>", function()

	local pos = vim.api.nvim_win_get_cursor(0)
	local current_line_index = pos[1]
	local line = vim.api.nvim_get_current_line()

	vim.api.nvim_buf_set_lines(
		0,
		current_line_index,
		current_line_index,
		false,
		{line}
	)

	vim.api.nvim_win_set_cursor(0, {
		current_line_index + 1,
		pos[2]
	})

	vim.print(current_line_index)
end, opts)

--
-- @@@ alignImportsOrExports
--
function AlignImportsOrExports(pattern)
	local pattern = '^(%s*import)%s+(.*)%s*(from)%s+(.+)$'
	local maxSize = 0
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	
	for i, line in ipairs(lines) do
		local res1, res2, res3, res4 = line:match(pattern)

		if  res2 ~= nil then
			res2 = res2:gsub('%s*$', '')
			
			if maxSize < #res2 then
				maxSize = #res2
			end
		end
	end

	for i, line in ipairs(lines) do
		local res1, res2, res3, res4 = line:match(pattern)

		if res2 ~= nil then
			res2 = res2:gsub('%s*$', '')
			lines[i] = res1 .. ' ' .. string.format('%-' .. maxSize + 1 .. 's', res2) .. res3 .. ' ' .. res4, i
		else
			lines[i] = line
		end
	end

	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end

vim.keymap.set("n", "<A-f>", function()
	AlignImportsOrExports('^(%s*import)%s+(.*)%s*(from)%s+(.+)$')
	AlignImportsOrExports('^(%s*export)%s+(.*)%s*(from)%s+(.+)$')
end, opts)

vim.keymap.set("i", "<A-f>", function()
	AlignImportsOrExports('^(%s*import)%s+(.*)%s*(from)%s+(.+)$')
	AlignImportsOrExports('^(%s*export)%s+(.*)%s*(from)%s+(.+)$')
end, opts)


--
-- @@@ AlignAndFormat
--
function AlignAndFormat(pattern, separator)
	local startLine = vim.api.nvim_buf_get_mark(0, '<')[1]
	local endLine   = vim.api.nvim_buf_get_mark(0, '>')[1]

	local maxSize = 0

	for i = startLine, endLine do
		local str = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
		local res1, res2 = str:match(pattern)

		if  res1 ~= nil then
			res1 = res1:gsub('%s*$', '')
			if maxSize < #res1 then maxSize = #res1 end
		end
	end

	for i = startLine, endLine do
		local str = vim.api.nvim_buf_get_lines(0, i-1, i, false)[1]
		local res1, res2 = str:match(pattern)

		if res1 ~= nil then
			res1 = res1:gsub('%s*$', '')
			
			if #res1 > 0 then
				-- Alignment for ':'
				if separator == ':' then
					str = string.format('%-' .. maxSize + 2 .. 's', res1 .. separator) .. res2
					vim.api.nvim_buf_set_lines(0, i - 1, i, false, {str})
				end
				
				-- Alignment for '='
				if separator == '=' then
					str = string.format('%-' .. maxSize + 1 .. 's', res1) .. separator .. ' ' .. res2
					vim.print(str)
					vim.api.nvim_buf_set_lines(0, i - 1, i, false, {str})
				end
			end
		end
	end
end

vim.keymap.set("n", "<A-S-f>", function()
	-- AlignAndFormat('^(%s*[^:]+):%s*(.+)$', ':')
	AlignAndFormat('^(.-):%s*(.+)$', ':')
	AlignAndFormat('^(.-)=%s*(.+)$', '=')
end, opts)


--
-- @@@ Build and Run C/C++ code
--
local Terminal = require("toggleterm.terminal").Terminal

vim.keymap.set("n", "<F9>", function()
	local file = vim.fn.expand("%:t")
	local output = vim.fn.expand("%:t:r") .. ".exe"
	local ext = vim.fn.expand("%:e")

	local cmd = ext == 'cpp'
		and 'echo COMPILING... && g++ "' .. file .. '" -std=c++17 -Os -s -o "' .. output  .. '" && "' .. output .. '"'
		or  'echo COMPILING... && gcc "' .. file .. '" -Os -s -o "' .. output  .. '" && "' .. output .. '"'

	-- vim.print(cmd)
	
	local term = Terminal:new({
		cmd = cmd,
		direction = "float",
		close_on_exit = false,
		hidden = true,
	})

	term:toggle()
	
end, { desc = "Build and Run C/C++ code" })