return {
  {
			"smartpde/telescope-recent-files",
  },
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"ThePrimeagen/harpoon",
			"nvim-lua/plenary.nvim",
		},
		init = function()
			local keymap_tele = function(key, func, desc)
				vim.keymap.set("n", key, func, { desc = desc, noremap = true, silent = true })
			end

			require("telescope").setup({})
			require("telescope").load_extension("recent_files")
			require("telescope").load_extension("harpoon")

			local telescope = require("telescope.builtin")
			keymap_tele("gr", telescope.lsp_references, "[Telescope] References to Symbol")
			keymap_tele("<leader>s", telescope.lsp_document_symbols, "[Telescope] File Symbols")
			keymap_tele("<leader>S", telescope.lsp_dynamic_workspace_symbols, "[Telescope] Project Symbols")
			keymap_tele("<leader>ht", ":Telescope harpoon marks<CR>", "[Harpoon] Telescope")
			keymap_tele(
				"<leader>p",
				":lua require('telescope').extensions.recent_files.pick()<CR>",
				"[Telescope] Recent Files"
			)
		end,
	},
}
