return {
	{

		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest",
			"nvim-neotest/neotest-python",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
			-- "rcarriga/nvim-dap-ui",
			"HiPhish/debugpy.nvim",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			local breakpoints = require("dap.breakpoints")
			local dap = require("dap")
			local dap_python = require("dap-python")
			-- local ui = require("dapui")

			local function dap_store_breakpoints()
				local bps = {}
				local breakpoints_by_buf = breakpoints.get()
				for buf, buf_bps in pairs(breakpoints_by_buf) do
					bps[tostring(buf)] = buf_bps
				end
				local fp = io.open("/tmp/breakpoints.json", "w")
				fp:write(vim.fn.json_encode(bps))
				fp:close()
			end

			local function dap_load_breakpoints()
				local fp = io.open("/tmp/breakpoints.json", "r")
				local content = fp:read("*a")
				local bps = vim.fn.json_decode(content)
				for buf, buf_bps in pairs(bps) do
					for _, bp in pairs(buf_bps) do
						local line = bp.line
						local opts = {
							condition = bp.condition,
							log_message = bp.logMessage,
							hit_condition = bp.hitCondition,
						}
						breakpoints.set(opts, tonumber(buf), line)
					end
				end
			end

			dap_python.setup("~/.local/pipx/venvs/debugpy/.venv/bin/python")
			dap_python.test_runner = "pytest"

			require("nvim-dap-virtual-text").setup()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
					}),
				},
			})

			-- config = {
			-- 	icons = { expanded = "▾", collapsed = "▸" },
			-- 	mappings = {
			-- 		expand = { "<CR>", "<LeftMouse>" },
			-- 		open = { "o" },
			-- 		remove = { "d", "x" },
			-- 		edit = { "c" },
			-- 		repl = { "r" },
			-- 	},
			-- 	layouts = {
			-- 		-- {
			-- 		-- 	elements = {
			-- 		-- 		"scopes",
			-- 		-- 	},
			-- 		-- 	position = "left",
			-- 		-- 	size = 0.25,
			-- 		-- },
			-- 		-- {
			-- 		-- 	elements = {
			-- 		-- 		"repl",
			-- 		-- 	},
			-- 		-- 	position = "bottom",
			-- 		-- 	size = 0.25,
			-- 		-- },
			-- 	},
			-- 	floating = {
			-- 		max_height = nil, -- These can be integers or a float between 0 and 1.
			-- 		max_width = nil, -- Floats will be treated as percentage of your screen.
			-- 		border = "rounded", -- Border style. Can be "single", "double" or "rounded"
			-- 		mappings = {
			-- 			close = { "q", "<Esc>" },
			-- 		},
			-- 	},
			-- 	windows = { indent = 1 },
			-- }

			local function disconnect()
				dap.disconnect()
				dap.close()
			end

			local function run_test()
				local neotest = require("neotest")
				neotest.run.run({ strategy = "dap" })
			end

			local function run_file()
				local neotest = require("neotest")
				neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
			end

			local wk = require("which-key")
			wk.register({
				d = {
					name = "DAP",
					b = { dap.toggle_breakpoint, "Toggle Breakpoint" },
					c = { dap.continue, "Continue" },
					n = { dap.step_over, "Next" },
					i = { dap.step_into, "Enter Context" },
					o = { dap.step_out, "Exit Context" },
					d = { run_test, "Test" },
					f = { run_file, "Test File" },
					q = { disconnect, "Disconnect" },
					x = {
						name = "Save/Load Breakpoints",
						l = { dap_load_breakpoints, "Load" },
						s = { dap_store_breakpoints, "Store" },
					},
				},
			}, { prefix = "<leader>" })

			-- vim.keymap.set("n", "<leader>du", ui.toggle)
			-- vim.keymap.set("v", "<leader>de", ui.eval)
			-- vim.keymap.set("n", "<leader>dg", ui.float_element)
			vim.keymap.set("n", "<Leader>du", function()
				require("dap").repl.open()
				-- local widgets = require("dap.ui.widgets")
				-- widgets.centered_float(widgets.frames)
			end)
			-- vim.keymap.set("n", "<Leader>df", function()
			-- 	local widgets = require("dap.ui.widgets")
			-- 	widgets.centered_float(widgets.frames)
			-- end)

			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "LspDiagnosticsDefaultError" })
			vim.fn.sign_define("DapLogPoint", { text = "◉", texthl = "LspDiagnosticsDefaultError" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "🞂", texthl = "LspDiagnosticsDefaultInformation", linehl = "CursorLine" }
			)

			-- ui.setup(config)

			-- dap.listeners.after.event_initialized["dapui_config"] = function()
			-- 	ui.open({ reset = true })
			-- end
			--
			-- dap.listeners.before.event_terminated["dapui_config"] = function()
			-- 	ui.close({})
			-- 	ui.setup(config)
			-- end
			--
			-- dap.listeners.before.event_exited["dapui_config"] = function()
			-- 	ui.close({})
			-- 	ui.setup(config)
			-- end
		end,
	},
}
