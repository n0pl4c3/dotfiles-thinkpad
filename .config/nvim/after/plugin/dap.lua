local dap = require("dap")
local ui = require("dapui")
local mason_registry = require("mason-registry")

local keymap_dap = function(key, func, desc)
	vim.keymap.set("n", key, func, { desc = desc })
end

keymap_dap("<F10>", '<cmd>lua require"dap".step_into()<CR>', "[DAP] Step into")
keymap_dap("<F11>", '<cmd>lua require"dap".step_over()<CR>', "[DAP] Step over")
keymap_dap("<F12>", '<cmd>lua require"dap".step_out()<CR>', "[DAP] Step out")
keymap_dap("<F5>", function()
	if vim.fn.filereadable(".vscode/launch.json") == 1 then
		require("dap.ext.vscode").load_launchjs()
	end
	require("dap").continue()
end, "[DAP] Continue")

keymap_dap("<leader>du", '<cmd>lua require"dapui".toggle()<CR>', "[DAP] UI Toggle")

keymap_dap("<leader>dr", function()
	require("dapui").close()
	require("dapui").open({ reset = true })
end, "[DAP] UI Reset")

keymap_dap("<leader>de", '<cmd>lua require"dapui".eval()<CR>', "[DAP] Eval expression")
keymap_dap("<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>', "[DAP] Toggle breakpoint")

vim.keymap.set("n", "<leader>dc", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', {
	desc = "DAP set breakpoint with condition",
})
keymap_dap(
	"<leader>dc",
	'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>',
	"[DAP] Set conditional breakpoint"
)

vim.api.nvim_create_user_command("DapDisconnect", function()
	require("dap").disconnect()
	require("dapui").close()
end, {})

-- Adapters

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
	name = "lldb",
}

-- Configurations

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- dapui
ui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				"scopes",
			},
			size = 0.3,
			position = "right",
		},
		{
			elements = {
				"repl",
				"breakpoints",
			},
			size = 0.3,
			position = "bottom",
		},
	},
	floating = {
		-- max_height = nil,
		-- max_width = nil,
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
		indent = 2,
	},
})
