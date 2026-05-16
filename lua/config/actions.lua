local opts = { noremap = true, silent = true }

--
-- @@@ alignImportsOrExports
--
function alignImportsOrExports(pattern)
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
	alignImportsOrExports('^(%s*import)%s+(.*)%s*(from)%s+(.+)$')
	alignImportsOrExports('^(%s*export)%s+(.*)%s*(from)%s+(.+)$')
end, opts)

vim.keymap.set("i", "<A-f>", function()
	alignImportsOrExports('^(%s*import)%s+(.*)%s*(from)%s+(.+)$')
	alignImportsOrExports('^(%s*export)%s+(.*)%s*(from)%s+(.+)$')
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
end

vim.keymap.set("n", "<A-S-f>", function()
	-- AlignAndFormat('^(%s*[^:]+):%s*(.+)$', ':')
	AlignAndFormat('^(.-):%s*(.+)$', ':')
	AlignAndFormat('^(.-)=%s*(.+)$', '=')
end, opts)