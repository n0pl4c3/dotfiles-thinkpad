return {{
	"ThePrimeagen/harpoon",
	init = function()
		local keymap_harpoon = function(key, func, desc)
			vim.keymap.set("n", key, func, { desc = desc, noremap = true, silent = true })
		end

		keymap_harpoon("<leader>hm", ':lua require("harpoon.mark").add_file()<CR>', "[Harpoon] Add File")
	end,
}}
