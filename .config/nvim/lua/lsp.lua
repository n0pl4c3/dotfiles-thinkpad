require("mason").setup()
require("mason-lspconfig").setup({
	-- A list of servers to automatically install if they're not already installed
	ensure_installed = { "pylsp", "lua_ls", "rust_analyzer" },
})

local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	--  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
end

lspconfig.pylsp.setup({
	on_attach = on_attach,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
})
