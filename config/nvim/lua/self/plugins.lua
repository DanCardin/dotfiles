vim.cmd([[packadd packer.nvim]])

local packer = require("packer")
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "plugins.lua", callback = packer.compile })

local function setup_debugger(use)
	use({
		"mfussenegger/nvim-dap-python",
		requires = {
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"HiPhish/debugpy.nvim",
		},
		config = function()
			local breakpoints = require("dap.breakpoints")
			local dap = require("dap")
			local dap_python = require("dap-python")
			local ui = require("dapui")

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

			-- dap_python.setup(".venv/bin/python")
			dap_python.setup("~/.nix-profile/bin/nvim-python3", { console = "internalConsole" })
			dap_python.test_runner = "pytest"

			require("nvim-dap-virtual-text").setup()
			ui.setup({
				icons = { expanded = "▾", collapsed = "▸" },
				mappings = {
					expand = { "<CR>", "<LeftMouse>" },
					open = { "o" },
					remove = { "d", "x" },
					edit = { "c" },
					repl = { "r" },
				},
				sidebar = {
					elements = {
						"breakpoints",
						"watches",
						"stacks",
						"scopes",
					},
					size = 40,
					position = "right",
				},
				tray = {
					elements = {
						"repl",
					},
					size = 10,
					position = "bottom",
				},
				floating = {
					max_height = nil, -- These can be integers or a float between 0 and 1.
					max_width = nil, -- Floats will be treated as percentage of your screen.
					border = "rounded", -- Border style. Can be "single", "double" or "rounded"
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				windows = { indent = 1 },
			})

			vim.keymap.set("n", "<leader>dq", function()
				dap.disconnect()
				dap.close()
			end)
			vim.keymap.set("n", "<leader>df", dap_python.test_method)
			vim.keymap.set("n", "<leader>dc", dap_python.test_class)
			vim.keymap.set("v", "<leader>df", dap_python.debug_selection)
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
			vim.keymap.set("n", "<leader>ds", dap_store_breakpoints)
			vim.keymap.set("n", "<leader>dl", dap_load_breakpoints)
			vim.keymap.set("n", "<leader>dc", dap.continue)
			vim.keymap.set("n", "<leader>dn", dap.step_over)
			vim.keymap.set("n", "<leader>di", dap.step_into)
			vim.keymap.set("n", "<leader>do", dap.step_out)
			vim.keymap.set("n", "<leader>dd", ui.toggle)
			vim.keymap.set("v", "<leader>dv", ui.eval)

			local signs = {
				DapBreakpoint = { text = "●", texthl = "LspDiagnosticsDefaultError" },
				DapLogPoint = { text = "◉", texthl = "LspDiagnosticsDefaultError" },
				DapStopped = { text = "🞂", texthl = "LspDiagnosticsDefaultInformation", linehl = "CursorLine" },
			}

			for sign, options in pairs(signs) do
				vim.fn.sign_define(sign, options)
			end

			dap.listeners.after["event_initialized"]["dapui_config"] = function()
				ui.open()
			end

			dap.listeners.before["event_terminated"]["dapui_config"] = function()
				ui.close()
			end

			dap.listeners.before["event_exited"]["dapui_config"] = function()
				ui.close()
			end
		end,
	})
end

local function setup_lsp(use)
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("self.lsp").setup()
		end,
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"RishabhRD/nvim-lsputils",
		requires = { "RishabhRD/popfix" },
	})
	use("tjdevries/lsp_extensions.nvim")
	use("ray-x/lsp_signature.nvim")
	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			local lightbulb = require("nvim-lightbulb")
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					lightbulb.update_lightbulb({ sign = { enabled = true }, virtual_text = { enabled = false } })
				end,
			})
		end,
	})
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use({
		"simrat39/symbols-outline.nvim",
		keys = "<C-s>",
		config = function()
			local outline = require("symbols-outline")
			vim.keymap.set("n", "<C-s>", outline.toggle_outline)
		end,
	})
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern", "lsp" },
				patterns = {
					"Makefile",
					"package.json",
					".venv",
					"pyproject.toml",
					".git",
					"_darcs",
					".hg",
					".bzr",
					".svn",
				},
			})
			require("telescope").load_extension("projects")
		end,
	})
	use({
		"lukas-reineke/lsp-format.nvim",
		config = function()
			require("lsp-format").setup()
		end,
	})
end

local function setup_treesitter(use)
	use({
		"mfussenegger/nvim-treehopper",
		config = function()
			local tsht = require("tsht")
			vim.keymap.set("v", "m", tsht.nodes)
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

			parser_configs.vue.install_info.url = "https://github.com/zealot128/tree-sitter-vue.git"
			parser_configs.pug = {
				install_info = {
					url = "https://github.com/zealot128/tree-sitter-pug",
					files = { "src/parser.c", "src/scanner.cc" },
				},
				filetype = "pug",
			}

			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
				},
				highlight = {
					enable = true,
					disable = { "vue" },
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						scope_incremental = "<CR>",
						node_incremental = "n",
						node_decremental = "p",
					},
				},
				autopairs = { enable = true },
				indent = {
					enable = false,
					disable = { "python" },
				},
				context_commentstring = {
					enable = true,
				},
			})
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
end

local function setup_misc(use)
	use({
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				undercurl = true,
				commentStyle = "italic",
				functionStyle = "NONE",
				keywordStyle = "bold",
				statementStyle = "bold",
				typeStyle = "NONE",
				variablebuiltinStyle = "italic",
				specialReturn = true,
				specialException = true,
				transparent = false,
				colors = {},
				overrides = {},
			})
		end,
	})

	use({
		"mvllow/modes.nvim",
		config = function()
			vim.opt.cursorline = true
			require("modes").setup()
		end,
	})

	use("tversteeg/registers.nvim")

	use({
		"VonHeikemen/searchbox.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
		config = function()
			local searchbox = require("searchbox")
			vim.keymap.set("n", "/", searchbox.incsearch)
			vim.keymap.set("n", "?", function()
				searchbox.incsearch({ reverse = true })
			end)
			vim.keymap.set("n", "<leader>s", function()
				searchbox.replace({ confirm = "menu" })
			end)
			vim.keymap.set("v", "/", function()
				searchbox.incsearch({ visual_mode = true })
			end)
		end,
	})
	use({
		"gelguy/wilder.nvim",
		run = ":UpdateRemotePlugins",
		requires = { "romgrk/fzy-lua-native" },
		event = { "CmdlineEnter" },
		config = function()
			vim.cmd([[
				call wilder#setup({'modes': [':', '/', '?']})
				call wilder#set_option('use_python_remote_plugin', 0)
				call wilder#set_option('pipeline', [
				  \   wilder#branch(
				  \     wilder#cmdline_pipeline({
				  \       'fuzzy': 1,
				  \       'fuzzy_filter': wilder#lua_fzy_filter(),
				  \     }),
				  \     wilder#vim_search_pipeline(),
				  \   ),
				  \ ])

				call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
				  \ 'highlights': {
				  \   'border': 'Normal',
				  \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#a9b669'}]),
				  \ },
				  \ 'border': 'rounded',
				  \ 'highlighter': wilder#lua_fzy_highlighter(),
				  \ 'separator': ' · ',
				  \ 'min_width': '40%',
				  \ 'left': [' ', wilder#popupmenu_devicons(), ' '],
				  \ 'right': [' ', wilder#popupmenu_scrollbar()],
				  \ })))
			]])
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.g.indent_blankline_char_highlight_list = { "Comment" }
			vim.g.indent_blankline_show_first_indent_level = false
			vim.g.indent_blankline_use_treesitter = true
			vim.g.indent_blankline_show_trailing_blankline_indent = false
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { hl = "GitSignsAdd", text = "", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				signcolumn = true,
				numhl = true,
				linehl = false,
				current_line_blame = true,
			})
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				diagnostics = "nvim_lsp",
			})

			vim.keymap.set("n", "<leader>b", ":BufferLinePick<CR>", { silent = true })
			vim.keymap.set("n", "<leader>,", ":BufferLineCyclePrev<CR>", { silent = true })
			vim.keymap.set("n", "<leader>.", ":BufferLineCycleNext<CR>", { silent = true })
			vim.keymap.set("n", "<leader><leader>,", ":BufferLineMovePrev<CR>", { silent = true })
			vim.keymap.set("n", "<leader><leader>.", ":BufferLineMoveNext<CR>", { silent = true })
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox-material",
					section_separators = { "", "" },
					component_separators = { "", "" },
					icons_enabled = true,
				},
				sections = {
					lualine_a = { { "mode", upper = true } },
					lualine_b = { { "branch", icon = "" } },
					lualine_c = { { "filename", file_status = true } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	})

	use({
		"ms-jpq/coq_nvim",
		branch = "coq",
		config = function()
			vim.g.coq_settings = { keymap = { jump_to_mark = "<c-n>", recommended = false } }
			local coq = require("coq")
			coq.Now("--shut-up")

			vim.keymap.set("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true })
			vim.keymap.set("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true })
			vim.keymap.set("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true })
			vim.keymap.set("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true })
		end,
	})
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })

	-- Navigation
	use({
		"kyazdani42/nvim-tree.lua",
		keys = "<C-n>",
		setup = function()
			vim.g.nvim_tree_width = 40
			vim.g.nvim_tree_gitignore = 1
			vim.g.nvim_tree_auto_open = 0
			vim.g.nvim_tree_auto_close = 1
			vim.g.nvim_tree_git_hl = 1
			vim.g.nvim_tree_disable_netrw = 1
			vim.g.nvim_tree_add_trailing = 1
			vim.g.nvim_tree_group_empty = 1
			vim.g.nvim_tree_lsp_diagnostics = 1
			vim.g.nvim_tree_highlight_opened_files = 1
			vim.g.nvim_tree_ignore = { ".git" }
			vim.g.nvim_tree_special_files = { "README.md", "Makefile" }
		end,
		config = function()
			vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
		end,
	})
	use({
		"ggandor/lightspeed.nvim",
		config = function()
			vim.g.lightspeed_no_default_keymaps = true
			require("lightspeed").setup({
				-- jump_on_partial_input_safety_timeout = 400,
				-- highlight_unique_chars = true,
				-- grey_out_search_area = true,
				-- match_only_the_start_of_same_char_seqs = true,
				-- limit_ft_matches = 5,
			})

			vim.keymap.set("n", "s", "<Plug>Lightspeed_omni_s")
			vim.keymap.set("n", "f", "<Plug>Lightspeed_f")
			vim.keymap.set("n", "F", "<Plug>Lightspeed_F")
			vim.keymap.set("n", "t", "<Plug>Lightspeed_t")
			vim.keymap.set("n", "T", "<Plug>Lightspeed_T")
		end,
		requires = "tpope/vim-repeat",
	})
	use("nvim-lua/popup.nvim")
	use({
		"nvim-lua/telescope.nvim",
		requires = {
			"nvim-telescope/telescope-fzy-native.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			telescope.setup({
				extensions = {
					fzy_native = {
						override_generic_sorter = false,
						override_file_sorter = true,
					},
				},
			})
			telescope.load_extension("fzy_native")

			vim.keymap.set("n", "<leader>o", builtin.git_files)
			vim.keymap.set("n", "gt", builtin.treesitter)
		end,
	})

	use({
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup({
				navigation = {
					cycle_navigation = true,
					enable_default_keybindings = true,
					persist_zoom = true,
				},
				resize = {
					enable_default_keybindings = true,
				},
			})
		end,
	})

	-- Utility
	use({
		"simnalamburt/vim-mundo",
		opt = true,
		keys = "<F6>",
		config = function()
			vim.keymap.set("n", "<F6>", ":MundoToggle<CR>")
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({
				enable_check_bracket_line = true,
				ignored_next_char = "[%w%.]",
				check_ts = true,
				ts_config = {
					lua = { "string" },
					python = { "string" },
				},
				map_bs = false,
				map_cr = false,
			})

			vim.keymap.set("i", "<cr>", function()
				if vim.fn.pumvisible() ~= 0 then
					if vim.fn.complete_info({ "selected" }).selected ~= -1 then
						return npairs.esc("<c-y>")
					else
						return npairs.esc("<c-e>") .. npairs.autopairs_cr()
					end
				else
					return npairs.autopairs_cr()
				end
			end, { expr = true })

			-- vim.keymap.set("i", "<bs>", function()
			-- 	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
			-- 		return npairs.esc("<c-e>") .. npairs.autopairs_bs()
			-- 	else
			-- 		return npairs.autopairs_bs()
			-- 	end
			-- end, { expr = true, noremap = true })
		end,
	})
	use({
		"roxma/vim-paste-easy",
		config = function()
			vim.g.paste_char_threshold = 1000
		end,
	})
	use({
		"b3nj5m1n/kommentary",
		config = function()
			require("kommentary.config").configure_language("default", {
				use_consistent_indentation = true,
				prefer_single_line_comments = true,
				multi_line_comment_strings = false,
				hook_function = function()
					require("ts_context_commentstring.internal").update_commentstring()
				end,
			})
		end,
	})
	use("zsugabubus/crazy8.nvim")
	use({
		"echasnovski/mini.nvim",
		config = function()
			require("mini.surround").setup({
				-- Number of lines within which surrounding is searched
				n_lines = 20,

				-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
				highlight_duration = 500,

				-- Pattern to match function name in 'function call' surrounding
				-- By default it is a string of letters, '_' or '.'
				funname_pattern = "[%w_%.]+",

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "Sa", -- Add surrounding
					delete = "Sd", -- Delete surrounding
					find = "Sr", -- Find surrounding (to the right)
					find_left = "Sl", -- Find surrounding (to the left)
					highlight = "Sh", -- Highlight surrounding
					replace = "Sc", -- Replace surrounding
					update_n_lines = "Sn", -- Update `n_lines`
				},
			})
		end,
	})
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({ background_colour = "#1e1e1e", render = "default" })
			vim.notify = require("notify")
		end,
	})

	use({
		"akinsho/nvim-toggleterm.lua",
		config = function()
			require("toggleterm").setup({
				open_mapping = "<c>t",
				hide_numbers = true,
				shade_terminals = true,
				start_in_insert = true,
				persist_size = true,
				close_on_exit = true,
				float_opts = {
					border = "curved",
				},
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				hidden = true,
				direction = "float",
				float_opts = {
					border = "curved",
				},
			})

			local function lazygit_toggle()
				lazygit:toggle()
			end

			vim.keymap.set("n", "<leader>gf", lazygit_toggle)
		end,
	})
end

local function setup_plugins(use)
	use({
		"wbthomason/packer.nvim",
		opt = true,
	})

	vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
	use({
		"lewis6991/impatient.nvim",
		rocks = "mpack",
	})
	use("andymass/vim-matchup")

	setup_lsp(use)
	setup_treesitter(use)
	setup_misc(use)
	setup_debugger(use)
end

local function setup()
	require("packer").startup({
		setup_plugins,
		config = { compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua" },
	})
end

return {
	setup = setup,
}
