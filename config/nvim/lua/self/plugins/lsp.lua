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
		"neovim/nvim-lspconfig",
		config = function()
			require("self.lsp").setup({
				opts = {
					inlay_hints = { enabled = true },
				},
			})
		end,
	},
	"nvimtools/none-ls.nvim",
	{
		"RishabhRD/nvim-lsputils",
		dependencies = { "RishabhRD/popfix" },
	},
	"tjdevries/lsp_extensions.nvim",
	"ray-x/lsp_signature.nvim",
	{
		"kosayoda/nvim-lightbulb",
		init = function()
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					local lightbulb = require("nvim-lightbulb")
					lightbulb.update_lightbulb({ sign = { enabled = true }, virtual_text = { enabled = false } })
				end,
			})
		end,
	},
	{
		"weilbith/nvim-code-action-menu",
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
