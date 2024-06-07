require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pylsp", "lua_ls", "rust_analyzer" },
})

local on_attach = function(_, bufnr)
	local keymap_buf = function(key, func, desc)
		vim.keymap.set("n", key, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
	end

	keymap_buf("<leader>e", vim.diagnostic.open_float, "Show Diagnostics")

	keymap_buf("gd", vim.lsp.buf.definition, "Go to definition")
	keymap_buf("gD", vim.lsp.buf.declaration, "Go to declaration")
	keymap_buf("gI", vim.lsp.buf.implementation, "Go to implementation")
	keymap_buf("<leader>D", vim.lsp.buf.type_definition, "Go to type definition")

	keymap_buf("K", vim.lsp.buf.hover, "Hover Menu")

	keymap_buf("<leader>r", vim.lsp.buf.rename, "Rename symbol")
	keymap_buf("<leader>a", vim.lsp.buf.code_action, "Apply code action")

	local telescope = require("telescope.builtin")
	keymap_buf("gr", telescope.lsp_references, "References to Symbol")
	keymap_buf("<leader>s", telescope.lsp_document_symbols, "File Symbols")
	keymap_buf("<leader>S", telescope.lsp_dynamic_workspace_symbols, "Project Symbols")
end

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

lspconfig.pylsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	Lua = {
		workspace = { checkThirdParty = false },
		telemetry = { enable = false },
	},
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.texlab.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
