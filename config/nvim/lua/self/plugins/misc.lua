local vim = vim

return {
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
			vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
			vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
			vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
			vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
		end,
	},
	{ "zsugabubus/crazy8.nvim" },
	{
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
			require("mini.indentscope").setup({})
			require("mini.diff").setup()
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	{ "andymass/vim-matchup" },
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"AckslD/nvim-FeMaco.lua",
		config = function()
			require("femaco").setup()
			vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
		end,
	},
	{
		[1] = "JoosepAlviste/nvim-ts-context-commentstring",
		-- context_commentstring nvim-treesitter module is deprecated, use require('ts_context_commentstring').setup {} and set vim.g.skip_ts_context_commentstring_module = true to speed up loading instead. Feature will be removed in ts_context_commentstring in the future (see https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/82 for more info)
		config = function()
			vim.g.skip_ts_context_commentstring_module = true

			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			local get_option = vim.filetype.get_option

			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
						and require("ts_context_commentstring.internal").calculate_commentstring()
					or get_option(filetype, option)
			end
		end,
	},
}
