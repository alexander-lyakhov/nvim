local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>r", ":source %<CR>")
-- vim.keymap.set("n", "<A-e>", ":Neotree %<CR>")
vim.keymap.set("n", "<A-e>", ":vnew<CR> :Ex<CR>")
vim.keymap.set("n", "<leader>vv", ":botright vnew<CR>")
vim.keymap.set("n", "<F2>", ":w<CR>")
vim.keymap.set("i", "<F2>", "<Esc>:w<CR>")
vim.keymap.set("n", "<A-F3>", ":q!<CR>")                          -- force close current tab
vim.keymap.set("n", "<A-x>", ":q!<CR>")                           -- force close current tab
vim.keymap.set("n", "<A-r>", ":e!<CR>")                           -- force reload file

vim.keymap.set("n", "<A-c>", "mmyiw`m")                           -- copy word under cursor
vim.keymap.set("i", "<A-c>", "<Esc>mmyiw`ma")                     -- copy word under cursor
vim.keymap.set("n", "<A-y>", "mm^v$hy`m`<Esc>")                   -- copy current line without CR

vim.keymap.set("n", "<A-v>", "diw\"0Pb")                          -- replace word under cursor with text from clipboard
vim.keymap.set("i", "<A-v>", "<Esc>diw\"0Pb")                     -- replace word under cursor with text from clipboard

vim.keymap.set("n", "<A-d>", "diw")                               -- delete a word under cursor
vim.keymap.set("i", "<C-\\>", "<Esc>")                            -- Return from insert mode

vim.keymap.set("n", "<A-S-d>", "yy p")
vim.keymap.set("v", "<A-S-d>", "y P")
vim.keymap.set("v", "<C-A-Right>", ">gv", opts)
vim.keymap.set("v", "<C-A-Left>", "<gv", opts)
vim.keymap.set("n", "<C-A-Right>", "<S-v>>gv", opts)
vim.keymap.set("n", "<C-A-Left>", "<S-v><gv", opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<A-p>", ">gv", opts)
vim.keymap.set("v", "<A-o>", "<gv", opts)

vim.keymap.set("n", "<S-Plus>",  ":%s/^  /\t/g")
vim.keymap.set("n", "<S-Minus>", ":%s/^\t/  /g")

vim.keymap.set("n", "<Esc>", ":noh<CR>")

-- @@@ Scroll viewport
vim.keymap.set("n", "<A-j>", "<C-e>")
vim.keymap.set("n", "<A-k>", "<C-y>")
vim.keymap.set("n", "<C-Down>", "<C-e>")
vim.keymap.set("n", "<C-Up>", "<C-y>")

-- @@@ Tabs
vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<A-1>", "1gt")
vim.keymap.set("n", "<A-2>", "2gt")
vim.keymap.set("n", "<A-3>", "3gt")
vim.keymap.set("n", "<A-4>", "4gt")
vim.keymap.set("n", "<A-5>", "5gt")
vim.keymap.set("n", "<A-6>", "6gt")
vim.keymap.set("n", "<A-7>", "7gt")
vim.keymap.set("n", "<A-8>", "8gt")
vim.keymap.set("n", "<A-9>", "9gt")
vim.keymap.set("n", "<A-w>", "<C-w>T")
vim.keymap.set("n", "<A-.>", ":+tabmove<CR>")
vim.keymap.set("n", "<A-,>", ":-tabmove<CR>")

-- @@@ Marks
vim.keymap.set("n", "<C-1>", "`1")

-- @@@ Split view navigation
vim.keymap.set("n", "<A-Right>", "<C-w><Right>")
vim.keymap.set("n", "<A-Left>", "<C-w><Left>")
vim.keymap.set("n", "<A-Down>", "<C-w><Down>")
vim.keymap.set("n", "<A-Up>", "<C-w><Up>")

vim.keymap.set("n", "<C-S-Up>", ":resize +1<CR>", opts)
vim.keymap.set("n", "<C-S-Down>", ":resize -1<CR>", opts)
vim.keymap.set("n", "<C--S-Left>", ":vertical resize +1<CR>", opts)
vim.keymap.set("n", "<C-S-Right>", ":vertical resize -1<CR>", opts)

-- @@@ Jump between breckets
vim.keymap.set("n", "<C-]>", "%")
vim.keymap.set("n", "<C-[>", "%")
vim.keymap.set("n", "<A-]>", "%")
vim.keymap.set("n", "<A-[>", "%")

-- @@@ Commands
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),

	callback = function()
		vim.highlight.on_yank()
	end,
})
