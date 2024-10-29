local lspsaga = {
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		init = function()
			local keymap_lspsaga = function(key, func, desc)
				vim.keymap.set("n", key, func, { desc = desc, noremap = true, silent = true })
			end
			require("lspsaga").setup({
        ui = {
          code_action = ''
        }
      })

			keymap_lspsaga("<leader>t", ":Lspsaga term_toggle<CR>", "[lspsaga] Toggle Terminal")
			keymap_lspsaga("<leader>a", ":Lspsaga code_action<CR>", "[lspsaga] Apply code action")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}

return lspsaga
