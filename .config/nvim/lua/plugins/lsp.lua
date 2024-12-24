local lspconfig = {
	{
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"Bilal2453/luvit-meta",
			},
			lazy = false,
			init = function()
				require("mason").setup()
				require("mason-lspconfig").setup({
					ensure_installed = { "pylsp", "lua_ls", "rust_analyzer", "bashls", "clangd", "hls"  },
				})

				local on_attach = function(_, bufnr)
					local keymap_buf = function(key, func, desc)
						vim.keymap.set("n", key, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
					end

					keymap_buf("<leader>e", vim.diagnostic.open_float, "[LSP] Show Diagnostics")

					keymap_buf("gd", vim.lsp.buf.definition, "[LSP] Go to definition")
					keymap_buf("gD", vim.lsp.buf.declaration, "[LSP] Go to declaration")
					keymap_buf("gI", vim.lsp.buf.implementation, "[LSP] Go to implementation")
					keymap_buf("<leader>D", vim.lsp.buf.type_definition, "[LSP] Go to type definition")

					keymap_buf("K", vim.lsp.buf.hover, "[LSP] Hover Menu")

					keymap_buf("<leader>r", vim.lsp.buf.rename, "[LSP] Rename symbol")
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

				lspconfig.bashls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})

        lspconfig.dartls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })

        lspconfig.nimls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })

        require('lspconfig').gleam.setup({})

				lspconfig.verible.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					cmd = { "verible-verilog-ls", "--rules_config_search" },
					root_dir = lspconfig.util.root_pattern({ ".git", "verilator.f" }),
					format_on_save = true,
				})

        lspconfig.hls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })

			end,
		},
		{
			"folke/lazydev.nvim",
			lazy = false,
			ft = "lua",
			opts = {
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{ -- optional completion source for require statements and module annotations
			"hrsh7th/nvim-cmp",
			lazy = false,
			opts = function(_, opts)
				opts.sources = opts.sources or {}
				table.insert(opts.sources, {
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				})
			end,
		},
	},
}

return lspconfig
