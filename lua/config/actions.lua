local opts = { noremap = true, silent = true }

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
