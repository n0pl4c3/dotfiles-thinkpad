return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua", -- optional
	},
	init = function()
		local keymap_neogit = function(key, func, desc)
			vim.keymap.set(
				"n",
				key,
				func,
				{ buffer = false, desc = desc, noremap = true, silent = true, nowait = true }
			)
		end

		keymap_neogit("<leader>gs", ":Neogit<CR>", "[Neogit] Open")
		vim.cmd([[
      highlight NeogitSectionHeader guifg=#957FB8
      highlight NeogitChangeDeleted guifg=#FF5D62
      highlight NeogitChangeModified guifg=#C0A36E
    ]])
		require("neogit").setup({})
	end,
}
