local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>r", ":source %<CR>", opts)
-- vim.keymap.set("n", "<A-e>", ":Neotree %<CR>", opts)
vim.keymap.set("n", "<A-e>", ":vnew<CR> :Ex<CR>", opts)
vim.keymap.set("n", "<leader>vv", ":botright vnew<CR>", opts)
vim.keymap.set("n", "<F2>", ":w<CR>", opts)
vim.keymap.set("i", "<F2>", "<Esc>:w<CR>", opts)
vim.keymap.set("n", "<A-F3>", ":q!<CR>")                                -- force close current tab
vim.keymap.set("n", "<A-x>", ":q!<CR>")                                 -- force close current tab
vim.keymap.set("n", "<A-r>", ":e!<CR>", opts)                           -- force reload file

vim.keymap.set("n", "<A-c>", "mmyiw`m", opts)                           -- copy word under cursor
vim.keymap.set("i", "<A-c>", "<Esc>mmyiw`ma", opts)                     -- copy word under cursor
vim.keymap.set("n", "<A-y>", "mm^v$hy`m`<Esc>", opts)                   -- copy current line without CR

vim.keymap.set("n", "<A-v>", "diw\"0Pb", opts)                          -- replace word under cursor with text from clipboard
vim.keymap.set("i", "<A-v>", "<Esc>diw\"0Pb", opts)                     -- replace word under cursor with text from clipboard

vim.keymap.set("n", "<A-d>", "diw", opts)                               -- delete a word under cursor
vim.keymap.set("i", "<C-\\>", "<Esc>", opts)                            -- Return from insert mode

-- @@@ Duplicate line
vim.keymap.set("n", "<A-S-d>", "yy p", opts)
vim.keymap.set("v", "<A-S-d>", "y P", opts)

-- @@@ Shift selected code to the right / left
vim.keymap.set("v", "<C-A-Right>", ">gv", opts)
vim.keymap.set("v", "<C-A-Left>", "<gv", opts)
vim.keymap.set("n", "<C-A-Right>", "<S-v>>gv", opts)
vim.keymap.set("n", "<C-A-Left>", "<S-v><gv", opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<A-p>", ">gv", opts)
vim.keymap.set("v", "<A-o>", "<gv", opts)

vim.keymap.set("n", "<S-Plus>",  ":%s/^  /\t/g", opts)
vim.keymap.set("n", "<S-Minus>", ":%s/^\t/  /g", opts)

vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- @@@ Scroll viewport
vim.keymap.set("n", "<A-j>", "<C-e>", opts)
vim.keymap.set("n", "<A-k>", "<C-y>", opts)
vim.keymap.set("n", "<C-Down>", "<C-e>", opts)
vim.keymap.set("n", "<C-Up>", "<C-y>", opts)
-- vim.keymap.set("n", "<S-A-Up>", "<C-y>", opts)
-- vim.keymap.set("n", "<S-A-Down>", "<C-e>", opts)

-- @@@ Tabs
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", opts)
vim.keymap.set("n", "<A-1>", "1gt", opts)
vim.keymap.set("n", "<A-2>", "2gt", opts)
vim.keymap.set("n", "<A-3>", "3gt", opts)
vim.keymap.set("n", "<A-4>", "4gt", opts)
vim.keymap.set("n", "<A-5>", "5gt", opts)
vim.keymap.set("n", "<A-6>", "6gt", opts)
vim.keymap.set("n", "<A-7>", "7gt", opts)
vim.keymap.set("n", "<A-8>", "8gt", opts)
vim.keymap.set("n", "<A-9>", "9gt", opts)
vim.keymap.set("n", "<A-w>", "<C-w>T", opts)
vim.keymap.set("n", "<A-.>", ":+tabmove<CR>", opts)
vim.keymap.set("n", "<A-,>", ":-tabmove<CR>", opts)

-- @@@ Marks
vim.keymap.set("n", "<C-1>", "`1", opts)

-- @@@ Split view navigation
vim.keymap.set("n", "<A-Right>", "<C-w><Right>", opts)
vim.keymap.set("n", "<A-Left>", "<C-w><Left>", opts)
vim.keymap.set("n", "<A-Down>", "<C-w><Down>", opts)
vim.keymap.set("n", "<A-Up>", "<C-w><Up>", opts)

vim.keymap.set("n", "<C-S-Up>", ":resize +1<CR>", opts)
vim.keymap.set("n", "<C-S-Down>", ":resize -1<CR>", opts)
vim.keymap.set("n", "<C--S-Left>", ":vertical resize +1<CR>", opts)
vim.keymap.set("n", "<C-S-Right>", ":vertical resize -1<CR>", opts)

-- @@@ Jump between breckets
vim.keymap.set("n", "<C-]>", "%", opts)
vim.keymap.set("n", "<C-[>", "%", opts)
vim.keymap.set("n", "<A-]>", "%", opts)
vim.keymap.set("n", "<A-[>", "%", opts)

-- @@@ Commands
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),

	callback = function()
		vim.highlight.on_yank()
	end,
})
