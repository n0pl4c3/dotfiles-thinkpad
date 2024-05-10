local vimtex = {
	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "zathura"
		end,
	},
}
return vimtex
