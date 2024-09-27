return {
	"https://github.com/apple/pkl-neovim.git",
	{
		"mfussenegger/nvim-treehopper",
		keys = {
			{
				"m",
				function()
					local tsht = require("tsht")
					tsht.nodes()
				end,
				mode = "v",
			},
		},
	},
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- 	event = "BufReadPre",
	-- 	config = function()
	-- 		require("treesitter-context").setup({
	-- 			enable = true,
	-- 			trim_scope = "inner",
	-- 			separator = "-",
	-- 			zindex = 1,
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

			parser_configs.typst = {
				install_info = {
					url = "https://github.com/SeniorMars/tree-sitter-typst", -- local path or git repo
					files = { "src/parser.c", "src/scanner.c" },
					branch = "main",
					generate_requires_npm = false,
					requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
				},
				filetype = "typst",
			}

			-- parser_configs.vue.install_info.url = "https://github.com/zealot128/tree-sitter-vue.git"
			-- parser_configs.pug = {
			-- 	install_info = {
			-- 		url = "https://github.com/zealot128/tree-sitter-pug",
			-- 		files = { "src/parser.c", "src/scanner.cc" },
			-- 	},
			-- 	filetype = "pug",
			-- }

			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
				},
				highlight = {
					enable = true,
					-- disable = { "vue" },
				},
				-- incremental_selection = {
				-- 	enable = true,
				-- 	keymaps = {
				-- 		scope_incremental = "<CR>",
				-- 		node_incremental = "n",
				-- 		node_decremental = "p",
				-- 	},
				-- },
				autopairs = { enable = true },
				indent = {
					enable = false,
					-- disable = { "python" },
				},
			})
		end,
	},
	{
		"sustech-data/wildfire.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("wildfire").setup()
		end,
	},
}
