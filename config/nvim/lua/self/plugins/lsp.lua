return {
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		name = "lsp_lines",
		config = function()
			vim.diagnostic.config({ virtual_lines = true })
			require("lsp_lines").setup()
		end,
	},
	{
		[1] = "neovim/nvim-lspconfig",
		config = function()
			require("self.lsp").setup()
		end,
	},
	-- "nvimtools/none-ls.nvim",
	{
		"RishabhRD/nvim-lsputils",
		dependencies = { "RishabhRD/popfix" },
	},
	"tjdevries/lsp_extensions.nvim",
	"ray-x/lsp_signature.nvim",
	{
		"aznhe21/actions-preview.nvim",
		cmd = "CodeActionMenu",
	},
	{
		"ahmedkhalf/project.nvim",
		name = "project_nvim",
		event = "BufReadPre",
		opts = {
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
		},
	},
	"lukas-reineke/lsp-format.nvim",
	"simrat39/rust-tools.nvim",
}
