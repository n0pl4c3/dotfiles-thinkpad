local copilot = {
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({})
		end,
	},
}

return copilot
