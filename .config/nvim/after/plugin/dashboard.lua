local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
-- Header
dashboard.section.header.val = {
	[[       .-''-.  ,---.    ,---..-./`) ,---.  ,---..-./`) ,---.    ,---.    ]],
	[[     .'_ _   \ |    \  /    |\ .-.')|   /  |   |\ .-.')|    \  /    |    ]],
	[[    / ( ` )   '|  ,  \/  ,  |/ `-' \|  |   |  .'/ `-' \|  ,  \/  ,  |    ]],
	[[   . (_ o _)  ||  |\_   /|  | `-'`"`|  | _ |  |  `-'`"`|  |\_   /|  |    ]],
	[[   |  (_,_)___||  _( )_/ |  | .---. |  _( )_  |  .---. |  _( )_/ |  |    ]],
	[[   '  \   .---.| (_ o _) |  | |   | \ (_ o._) /  |   | | (_ o _) |  |    ]],
	[[    \  `-'    /|  (_,_)  |  | |   |  \ (_,_) /   |   | |  (_,_)  |  |    ]],
	[[     \       / |  |      |  | |   |   \     /    |   | |  |      |  |    ]],
	[[      `'-..-'  '--'      '--' '---'    `---`     '---' '--'      '--'    ]],
}

-- Buttons
dashboard.section.buttons.val = {
	dashboard.button("f", "󰍉" .. " Find file", "<cmd>Telescope find_files<cr>"),
	dashboard.button("e", "" .. " New file", "<cmd>enew<cr>"),
	dashboard.button("r", "󰄉" .. " Recent files", "<cmd>Telescope oldfiles<cr>"),
	dashboard.button("t", "" .. " Find text", "<cmd>Telescope live_grep<cr>"),
	dashboard.button("u", "" .. " Update", "<cmd>Lazy sync<cr>"),
	dashboard.button("q", "" .. " Quit", "<cmd>qa<cr>"),
}

local quote = "Let's get to work!"
dashboard.section.footer.val = quote

dashboard.opts.opts.noautocmd = true
vim.cmd([[autocmd User AlphaReady echo 'ready' ]])
alpha.setup(dashboard.config)
