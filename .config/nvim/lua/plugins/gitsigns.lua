local gitsigns = {
	{
    "lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
}

return gitsigns
