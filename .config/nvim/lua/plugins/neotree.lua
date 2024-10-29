local neotree = {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		init = function()
			local neotree = require("neo-tree")

			local keymap_buf = function(key, func, desc)
				vim.keymap.set("n", key, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
			end

			keymap_buf("<leader><TAB>", ":Neotree toggle<CR>", "[Neotree] Open/Close")

			neotree.setup({
				close_if_last_window = true,
				enable_git_status = true,
				enable_diagnostics = true,
				commands = {},
				window = {
					width = 25,
				},
			})
		end,
	},
}

return neotree
