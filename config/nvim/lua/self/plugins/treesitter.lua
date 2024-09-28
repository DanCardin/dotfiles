return {
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
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
				},
				highlight = {
					enable = true,
				},
				autopairs = { enable = true },
				indent = {
					enable = true,
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
