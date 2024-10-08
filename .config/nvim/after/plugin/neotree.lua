local neotree = require("neo-tree")

local keymap_buf = function(key, func, desc)
	vim.keymap.set("n", key, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
end

keymap_buf("<leader><TAB>", ":Neotree<CR>", "[Neotree] Open/Close")

neotree.setup({
	close_if_last_window = true,
	enable_git_status = true,
	enable_diagnostics = true,
	commands = {},
	window = {
		width = 25,
	},
})
