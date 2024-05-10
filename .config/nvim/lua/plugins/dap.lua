local dap = {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local ui = require("dapui")
			local mason_registry = require("mason-registry")

			-- General Keybinds

			vim.keymap.set("n", "<F10>", '<cmd>lua require"dap".step_into()<CR>', { desc = "DAP step into" })
			vim.keymap.set("n", "<F11>", '<cmd>lua require"dap".step_over()<CR>', { desc = "DAP step over" })
			vim.keymap.set("n", "<F12>", '<cmd>lua require"dap".step_out()<CR>', { desc = "DAP step out" })
			vim.keymap.set("n", "<F5>", function()
				if vim.fn.filereadable(".vscode/launch.json") == 1 then
					require("dap.ext.vscode").load_launchjs()
				end

				require("dap").continue()
			end, { desc = "DAP continue" })

			vim.keymap.set("n", "<leader>du", '<cmd>lua require"dapui".toggle()<CR>', { desc = "DAP toggle UI" })

			-- reset dap ui
			vim.keymap.set("n", "<leader>dr", function()
				local dapui = require("dapui")
				dapui.close()
				dapui.open({ reset = true })
			end, { desc = "DAP reset UI" })

			vim.keymap.set("n", "<leader>de", '<cmd>lua require"dapui".eval()<CR>', { desc = "DAP eval" })

			vim.keymap.set(
				"n",
				"<leader>db",
				'<cmd>lua require"dap".toggle_breakpoint()<CR>',
				{ desc = "DAP toggle breakpoint" }
			)

			vim.keymap.set(
				"n",
				"<leader>dc",
				'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
				{
					desc = "DAP set breakpoint with condition",
				}
			)

			vim.api.nvim_create_user_command("DapDisconnect", function()
				require("dap").disconnect()
				require("dapui").close()
			end, {})

			-- dap.adapters.lldb = {
			-- 	type = "server",
			-- 	port = "${port}",
			-- 	executable = {
			-- 		command = "/sbin/lldb-vscode",
			-- 		args = { "--port", "${port}" },
			-- 	},
			-- }
			--

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

			-- Beauty
			--vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

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
				},
			})
		end,
	},
}

return dap
