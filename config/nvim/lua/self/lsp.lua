local vim = vim
local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = {
			border = "single",
		},
	})
	require("lsp-format").on_attach(client)

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- vim.api.nvim_create_autocmd("CursorHold", {
	-- 	pattern = "*",
	-- 	callback = function()
	-- 		vim.diagnostic.open_float(0, { scope = "line", focusable = false })
	-- 	end,
	-- })

	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>k", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<tab>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<tab>", "<cmd>CodeActionMenu<CR>", opts)

	vim.api.nvim_set_keymap(
		"n",
		"<leader>p",
		-- "<cmd>lua vim.diagnostic.goto_prev({ float =  { border = 'double' }})<CR>",
		"<cmd>lua vim.diagnostic.goto_prev({float = false})<CR>",
		opts
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>n",
		"<cmd>lua vim.diagnostic.goto_next({float = false})<CR>",
		-- "<cmd>lua vim.diagnostic.goto_next({ float =  { border = 'double' }})<CR>",
		opts
	)

	-- vim.lsp.handlers["textDocument/codeAction"] = require("telescope.builtin").lsp_code_actions
	vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
	vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
	vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
	vim.lsp.handlers["textDocument/typeDefinition"] = require("telescope.builtin").lsp_type_definitions
	vim.lsp.handlers["textDocument/implementation"] = require("telescope.builtin").lsp_implementation
	vim.lsp.handlers["textDocument/documentSymbol"] = require("telescope.builtin").lsp_document_symbols
	vim.lsp.handlers["workspace/symbol"] = require("telescope.builtin").lsp_workspace_symbols

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = true,
		signs = true,
		virtual_lines = false,
		float = false,
		update_in_insert = false,
	})
end

local function setup_null_ls()
	local null_ls = require("null-ls")
	local h = require("null-ls.helpers")
	local methods = require("null-ls.methods")

	local FORMATTING = methods.internal.FORMATTING

	local isort = h.make_builtin({
		name = "pisort",
		method = FORMATTING,
		filetypes = { "python" },
		generator_opts = {
			command = "isort",
			args = {
				"--stdout",
				"-sp",
				"pyproject.toml",
				"--filename",
				"$FILENAME",
				"-",
			},
			to_stdin = true,
		},
		factory = h.formatter_factory,
	})

	null_ls.setup({
		-- debug = true,
		sources = {
			null_ls.builtins.formatting.black,
			-- null_ls.builtins.formatting.deno_fmt,
			null_ls.builtins.formatting.eslint_d,
			null_ls.builtins.formatting.fixjson,
			-- null_ls.builtins.formatting.isort,
			isort,
			null_ls.builtins.formatting.nginx_beautifier,
			null_ls.builtins.formatting.prettier,
			-- null_ls.builtins.formatting.rustywind,
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.formatting.sqlformat,
			null_ls.builtins.formatting.shellharden,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.terraform_fmt,
			null_ls.builtins.diagnostics.eslint_d,
			null_ls.builtins.diagnostics.flake8,
			null_ls.builtins.diagnostics.write_good,
			-- null_ls.builtins.diagnostics.mypy,
			-- null_ls.builtins.diagnostics.markdownlint,
			null_ls.builtins.diagnostics.selene, -- lua
			-- null_ls.builtins.code_actions.gitsigns,
		},
		on_attach = on_attach,
	})
end

local function setup_inlay_hints()
	local inlay_hints = vim.api.nvim_create_augroup("inlay-hints", { clear = true })
	vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWinEnter", "TabEnter", "BufWritePost" }, {
		pattern = "*.rs",
		group = inlay_hints,
		callback = function()
			local lsp_extensions = require("lsp_extensions")
			lsp_extensions.inlay_hints({
				prefix = " » ",
				aligned = true,
				highlight = "NonText",
			})
		end,
	})
end

local sumneko_root_path = vim.fn.expand("~") .. "/.local/lua-language-server"
local lua_config = {
	cmd = { sumneko_root_path .. "/bin/macOS/lua-language-server", "-E", sumneko_root_path .. "/main.lua" },
	on_attach = on_attach,
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}

local rust_config = {
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
				extraArgs = "--target-dir /tmp/rust-analyzer-check",
			},
			assist = {
				importGranularity = "module",
				importPrefix = "by_self",
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
}

local pyright_config = {
	on_attach = on_attach,
	settings = {
		python = {
			venvPath = ".",
			venv = "venv",
		},
	},
}

local volar_config = {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
}

local dmypyls_config = {
	default_config = {
		cmd = { "dmypy-ls" },
		filetypes = { "python" },
		root_dir = lspconfig.util.root_pattern(
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile"
		),
		single_file_support = true,
	},
}

local function setup()
	local coq = require("coq")

	-- require("lspconfig.configs")["dmypyls"] = dmypyls_config

	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		virtual_lines = false,
		-- float = { border = "single" },
		float = false,
	})

	local function lsp_setup(namespace, config)
		namespace.setup(coq.lsp_ensure_capabilities(config))
	end

	lsp_setup(lspconfig.esbonio, { on_attach = on_attach })
	lsp_setup(lspconfig.jsonls, { on_attach = on_attach, cmd = { "vscode-json-languageserver", "--stdio" } })
	lsp_setup(lspconfig.pyright, pyright_config)
	lsp_setup(lspconfig.sumneko_lua, lua_config)
	lsp_setup(lspconfig.rust_analyzer, rust_config)
	lsp_setup(lspconfig.volar, volar_config)
	-- lsp_setup(lspconfig.dmypyls, { on_attach = on_attach })

	setup_null_ls()
	setup_inlay_hints()
end

return {
	setup = setup,
}
