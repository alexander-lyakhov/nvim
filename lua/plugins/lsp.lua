vim.lsp.config["clangd"] = {
	cmd = {"clangd"},
	filetype = { "c", "cpp" },
	root_markers = { ".git" }
}
vim.lsp.enable("clangd")
--[[
vim.lsp.config["rust"] = {
	cmd = {"rust-analyzer"},
	filetype = { "rust" },
	root_markers = { "Cargo.toml", ".git"}
}
vim.lsp.enable("rust")
--]]
--[[
.lsp.config["ts"] = {
	cmd = {"typescript-language-server"},
	filetype = { "ts", "vue" },
	root_markers = { ".git"}
}
vim.lsp.enable("ts")
--]]

-- @@@ Diagnostics
vim.keymap.set("n", "H", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.diagnostic.config({
	signs = true,
	underline = true,
	virtual_text = true,
	virtual_lines = false,
	update_in_insert = true,
	float = {
		-- UI.
		header = false,
		border = 'rounded',
		focusable = true,
	}
})

