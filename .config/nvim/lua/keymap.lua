local keymap_general = function(key, func, desc)
	vim.keymap.set("n", key, func, { desc = desc, noremap = true, silent = true })
end

-- Window Jumping w/ <CTRL>+<h,j,k,l>
keymap_general("<C-h>", "<C-w>h", "Jump Window Left")
keymap_general("<C-j>", "<C-w>j", "Jump Window Down")
keymap_general("<C-k>", "<C-w>k", "Jump Window Up")
keymap_general("<C-l>", "<C-w>l", "Jump Window Right")

-- Window Resize w/ <CTRL>+<arrows>
keymap_general("<C-Up>", ":resize -2<CR>", "Horiz. Resize -2")
keymap_general("<C-Down>", ":resize +2<CR>", "Horiz. Resize +2")
keymap_general("<C-Left>", ":vertical resize -2<CR>", "Vert. Resize -2")
keymap_general("<C-Right>", ":vertical resize +2<CR>", "Vert. Resize +2")

-- Buffer Cycling
keymap_general("<leader>.", ":bnext<CR>", "Next Buffer")
keymap_general("<leader>,", ":bprevious<CR>", "Prev. Buffer")

-- Windows
keymap_general("<leader>vs", ":vs<CR>", "Vertical Split")
keymap_general("<leader>hs", ":sp<CR>", "Horiz. Split")

keymap_general("<leader>q", ":bp|bd #<CR>", "Close Buffer")
