return {
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {
			--Config goes here
		},
	},
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	event = "BufReadPre",
	-- 	config = function()
	-- 		local npairs = require("nvim-autopairs")
	-- 		npairs.setup({
	-- 			enable_check_bracket_line = true,
	-- 			ignored_next_char = "[%w%.]",
	-- 			check_ts = true,
	-- 			ts_config = {
	-- 				lua = { "string" },
	-- 				python = { "string" },
	-- 			},
	-- 			map_bs = false,
	-- 			map_cr = false,
	-- 		})
	--
	-- 		vim.keymap.set("i", "<cr>", function()
	-- 			if vim.fn.pumvisible() ~= 0 then
	-- 				if vim.fn.complete_info({ "selected" }).selected ~= -1 then
	-- 					return npairs.esc("<c-y>")
	-- 				else
	-- 					return npairs.esc("<c-e>") .. npairs.autopairs_cr()
	-- 				end
	-- 			else
	-- 				return npairs.autopairs_cr()
	-- 			end
	-- 		end, { expr = true })
	-- 	end,
	-- },
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
	{
		"numToStr/Comment.nvim",
		opts = {
			mappings = false,
		},
		keys = {
			{ "gc", "<Plug>(comment_toggle_linewise_current)", mode = "n" },
			{ "gc", "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
			{ "gb", "<Plug>(comment_toggle_blockwise_visual)", mode = "v" },
		},
	},
	"zsugabubus/crazy8.nvim",
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
		"folke/neodev.nvim",
		opts = {
			debug = true,
			experimental = {
				pathStrict = true,
			},
			library = {
				runtime = "~/projects/neovim/runtime/",
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
}
