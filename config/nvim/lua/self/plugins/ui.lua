return {
	"nvim-lua/popup.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzy-native.nvim",
			"debugloop/telescope-undo.nvim",
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
				undo = {},
			})
			telescope.load_extension("fzy_native")
			telescope.load_extension("undo")
			telescope.load_extension("notify")
			vim.keymap.set("n", "<leader>o", builtin.git_files)
			vim.keymap.set("n", "gt", builtin.treesitter)
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		event = "VeryLazy",
		opts = function()
			local builtin = require("statuscol.builtin")
			return {
				setopt = true,
				segments = {
					{
						sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
						click = "v:lua.ScSa",
					},
					{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
					{
						sign = {
							name = {
								"Dap",
								"neotest",
							},
							maxwidth = 1,
							colwidth = 1,
							auto = false,
						},
						click = "v:lua.ScSa",
					},
					-- {
					-- 	text = { "│" },
					-- 	sign = {
					-- 		name = { "GitSigns" },
					-- 		maxwidth = 1,
					-- 		colwidth = 1,
					-- 		auto = true,
					-- 	},
					-- 	click = "v:lua.ScSa",
					-- },
				},
				ft_ignore = { "help", "vim", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "toggleterm" },
			}
		end,
	},
	{
		[1] = "folke/noice.nvim",
		version = "4.4.7",
		event = "VimEnter",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			routes = {
				{
					filter = { find = "Pattern not found" },
					opts = { skip = true },
				},
				{
					filter = { kind = { "search_count", "echo" } },
					opts = { skip = true },
				},
			},
			lsp = { progress = { enabled = false } },
		},
	},
	{
		[1] = "rebelot/kanagawa.nvim",
		opts = {
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { bold = true },
			statementStyle = { bold = true },
			typeStyle = {},
			variablebuiltinStyle = { italic = true },
			specialReturn = true,
			specialException = true,
			transparent = false,
		},
	},
	"mvllow/modes.nvim",
	{
		"akinsho/nvim-bufferline.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
				},
			})

			vim.keymap.set("n", "<leader>b", ":BufferLinePick<CR>", { silent = true })
			vim.keymap.set("n", "<leader>,", ":BufferLineCyclePrev<CR>", { silent = true })
			vim.keymap.set("n", "<leader>.", ":BufferLineCycleNext<CR>", { silent = true })
			vim.keymap.set("n", "<leader><leader>,", ":BufferLineMovePrev<CR>", { silent = true })
			vim.keymap.set("n", "<leader><leader>.", ":BufferLineMoveNext<CR>", { silent = true })
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		opts = {
			options = {
				theme = "kanagawa",
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
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#1e1e1e",
				fps = 30,
				render = "minimal",
				stages = "fade_in_slide_out",
				timeout = 3000,
				top_down = false,
				max_width = 60,
			})
			vim.notify = require("notify")
		end,
	},
	{
		"meatballs/notebook.nvim",
		config = function()
			require("notebook").setup()
		end,
	},
	{
		"ivanjermakov/troublesum.nvim",
		config = function()
			require("troublesum").setup()
		end,
	},
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- 	init = function()
	-- 		vim.o.timeout = true
	-- 		vim.o.timeoutlen = 300
	-- 	end,
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	},
	-- },
	{
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("virt-column").setup()
		end,
	},
	{ "VidocqH/lsp-lens.nvim" },
	{ "brenoprata10/nvim-highlight-colors" },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				multilines = true,
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
