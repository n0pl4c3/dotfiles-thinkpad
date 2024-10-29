local noice = {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		init = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},

				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})

			local keymap_noice = function(key, func, desc)
				vim.keymap.set("n", key, func, { desc = desc, noremap = true, silent = true })
			end

			keymap_noice("<leader>x", ":Noice dismiss<CR>", "[Noice] Dismiss Messages")

			keymap_noice("<leader>ne", ":Noice errors<CR>", "[Noice] Errors in Split")

			keymap_noice("<leader>nt", ":Noice telescope<CR>", "[Noice] Messages in Telescope")
		end,
	},
}
return noice
