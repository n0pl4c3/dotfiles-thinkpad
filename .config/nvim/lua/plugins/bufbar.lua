local bufbar = {
	{
		"ojroques/nvim-bufbar",
    init = function()
      require('bufbar').setup {
        theme = 'default',
      }
		end,
	},
}

return bufbar
