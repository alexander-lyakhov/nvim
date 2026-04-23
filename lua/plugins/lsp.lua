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
vim.keymap.set("n", "H", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
