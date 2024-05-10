local completion = {
    {
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
			"hrsh7th/nvim-cmp", -- cmdline auto-completion
		},
		config = function()
			require("cmp")
		end,
	},
	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
}

return completion
