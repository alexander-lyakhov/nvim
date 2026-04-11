-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")

-- require("plugins.neotree")
-- require("plugins.treesitter")
require("everforest").load()
require("plugins.lualine")
require("telescope").load_extension "file_browser"


vim.opt.guifont = "JetBrainsMono\\ NFM:h24"
vim.o.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.o.scrolloff = 10

vim.opt.virtualedit = 'all'
vim.opt.startofline = off
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
-- vim.o.startofline = false

vim.g.have_nerd_font = true


-- vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>r", ":source %<CR>")
vim.keymap.set("n", "<A-e>", ":Neotree %<CR>")
vim.keymap.set("n", "<leader>vv", ":botright vnew<CR>")
vim.keymap.set("n", "<F2>", ":w<CR>")
vim.keymap.set("i", "<F2>", "<Esc>:w<CR>")
vim.keymap.set("n", "<A-F3>", ":q!<CR>")

vim.keymap.set("n", "<A-S-d>", "yy p<CR>")

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
vim.keymap.set("n", "<A-w>", ":tab split<CR> :tabp<CR> :x<CR> :tabn<CR>")
vim.keymap.set("n", "<A-.>", ":+tabmove<CR>")
vim.keymap.set("n", "<A-,>", ":-tabmove<CR>")

-- @@@ Split view navigation
vim.keymap.set("n", "<A-Right>", "<C-w><Right>")
vim.keymap.set("n", "<A-Left>", "<C-w><Left>")
vim.keymap.set("n", "<A-Down>", "<C-w><Down>")
vim.keymap.set("n", "<A-Up>", "<C-w><Up>")

-- @@@ Jump between breckets
vim.keymap.set("n", "<C-]>", "%")
vim.keymap.set("n", "<C-[>", "%")
vim.keymap.set("n", "<A-]>", "%")
vim.keymap.set("n", "<A-[>", "%")


-- vim.keymap.set("n", "<leader>o", ":Neotree float %<CR>")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>o', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<A-0>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<A-/>', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<A-b>', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<A-0>', ":Telescope file_browser<CR>", { desc = 'Telescope file browser' })


