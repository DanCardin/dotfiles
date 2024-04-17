local lspconfig = require("lspconfig")
local cmp = require("cmp_nvim_lsp")
local null_ls = require("null-ls")
local null_ls_h = require("null-ls.helpers")
local null_ls_methods = require("null-ls.methods")

local vim = vim

local function on_attach(client, bufnr)
	vim.lsp.inlay_hint.enable()

	require("lsp-format").on_attach(client)

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>k", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<tab>", "<cmd>CodeActionMenu<CR>", opts)

	vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua vim.diagnostic.goto_prev({float = false})<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua vim.diagnostic.goto_next({float = false})<CR>", opts)

	vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
	vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
	vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
	vim.lsp.handlers["textDocument/typeDefinition"] = require("telescope.builtin").lsp_type_definitions
	vim.lsp.handlers["textDocument/implementation"] = require("telescope.builtin").lsp_implementation
	vim.lsp.handlers["textDocument/documentSymbol"] = require("telescope.builtin").lsp_document_symbols
	vim.lsp.handlers["workspace/symbol"] = require("telescope.builtin").lsp_workspace_symbols

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = false,
		virtual_lines = true,
		signs = true,
		float = false,
		update_in_insert = true,
	})
end

local lua_config = {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true)
			},
		})
	end,
	settings = {
		Lua = {},
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
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				loadOutDirsFromCheck = true,
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
			diagnostics = { disabled = { "unresolved-proc-macro" } },
		},
	},
	capabilities = cmp.default_capabilities(),
}

local pyright_config = {
	on_attach = on_attach,
	capabilities = cmp.default_capabilities(),
	flags = {
		-- This will be the default in neovim 0.7+
		debounce_text_changes = 500,
	},
	settings = {
		basedpyright = {
			disableOrganizeImports = true,
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
			},
		},
	},
}

local volar_config = {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	capabilities = cmp.default_capabilities(),
	cmd = { "vue-language-server", "--stdio" },
}

local typst_config = { on_attach = on_attach, capabilities = cmp.default_capabilities() }

local jinja_config = {
	on_attach = on_attach,
	capabilities = cmp.default_capabilities(),
	filetypes = { "jinja", "html" },
}

local json_config = {
	on_attach = on_attach,
	cmd = { "vscode-json-languageserver", "--stdio" },
	capabilities = cmp.default_capabilities(),
}
local ruff_config = {
	on_attach = on_attach,
	init_options = {
		settings = {
			args = { "--ignore=E501" },
		},
	},
	capabilities = cmp.default_capabilities(),
}

local html_config = {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
}
html_config.capabilities.textDocument.completion.completionItem.snippetSupport = true

local null_config = {
	sources = {
		null_ls.builtins.formatting.nginx_beautifier,
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.formatting.codespell,
		null_ls.builtins.diagnostics.djlint.with({ args = { "--indent", "2", "--quiet", "-" } }),
		null_ls.builtins.formatting.djlint.with({ args = { "--indent", "2", "--reformat", "-" } }),
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.terraform_fmt,
		null_ls.builtins.diagnostics.selene,
		null_ls.builtins.formatting.prettierd,
		null_ls_h.make_builtin({
			name = "sleek",
			meta = {
				url = "https://github.com/nrempel/sleek",
			},
			method = null_ls_methods.internal.FORMATTING,
			filetypes = { "sql" },
			generator_opts = {
				command = "sleek",
				to_stdin = true,
			},
			factory = null_ls_h.formatter_factory,
		}),
	},
	on_attach = on_attach,
}

local function setup()
	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		virtual_lines = false,
		float = false,
	})

	-- lspconfig.rust_analyzer.setup(rust_config)
	lspconfig.bashls.setup({})
	lspconfig.denols.setup({})
	lspconfig.eslint.setup({})
	lspconfig.html.setup(jinja_config)
	lspconfig.jinja_lsp.setup(jinja_config)
	lspconfig.jsonls.setup(json_config)
	lspconfig.lua_ls.setup(lua_config)
	lspconfig.basedpyright.setup(pyright_config)
	lspconfig.ruff_lsp.setup(ruff_config)
	lspconfig.typst_lsp.setup(typst_config)
	lspconfig.volar.setup(volar_config)
	lspconfig.markdown_oxide.setup({
		capabilities = cmp.default_capabilities(),
		root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
	})

	vim.g.markdown_fenced_languages = {
		"ts=typescript",
	}

	null_ls.setup(null_config)

	require("rust-tools").setup({
		server = {
			on_attach = on_attach,
			capabilities = cmp.default_capabilities(),
			settings = {
				["rust-analyzer"] = {
					-- enable clippy on save
					checkOnSave = {
						command = "clippy",
						-- extraArgs = { "--all", "--", "-W", "clippy::all" },
						extraArgs = "--target-dir /tmp/rust-analyzer-check",
					},
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					rustfmt = {
						extraArgs = { "+nightly" },
					},
					cargo = {
						loadOutDirsFromCheck = true,
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true,
					},
				},
			},
			tools = {
				inlay_hints = {
					auto = false,
				},
			},
		},
	})
end

return {
	setup = setup,
}
