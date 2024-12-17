local function on_attach(client, bufnr)
  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    virtual_lines = false,
    float = false,
  })

  require("lsp-format").on_attach(client)
  local actions_preview = require("actions-preview")

  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

  local opts = { noremap = true, buffer = true }
  vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.keymap.set("n", "<leader>k", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.keymap.set("n", "<tab>", actions_preview.code_actions, opts)

  vim.keymap.set("n", "<leader>p", "<cmd>lua vim.diagnostic.goto_prev({float = false})<CR>", opts)
  vim.keymap.set("n", "<leader>n", "<cmd>lua vim.diagnostic.goto_next({float = false})<CR>", opts)

  vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
  vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
  vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
  vim.lsp.handlers["textDocument/typeDefinition"] = require("telescope.builtin").lsp_type_definitions
  vim.lsp.handlers["textDocument/implementation"] = require("telescope.builtin").lsp_implementation
  vim.lsp.handlers["textDocument/documentSymbol"] = require("telescope.builtin").lsp_document_symbols
  vim.lsp.handlers["workspace/symbol"] = require("telescope.builtin").lsp_workspace_symbols
end

local servers = {
  eslint = {},
  helm_ls = {},
  html = {},
  typst_lsp = {},
  bashls = {},
  typos_lsp = {},
  denols = {
    single_file_support = false,
    root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc", "package.json", ".git"),
  },
  taplo = {
    cmd = { "taplo", "lsp", "-c", vim.fn.expand("$HOME/.config/taplo.toml"), "stdio" },
  },
  yamlls = {
    settings = {
      yaml = {
        format = {
          enable = true,
          printWidth = 100,
        },
      },
    },
  },
  markdown_oxide = {
    root_dir = require("lspconfig").util.root_pattern(".git", vim.fn.getcwd()),
  },
  lua_ls = {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
        return
      end

      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          version = "LuaJIT",
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
          },
        },
      })
    end,
    settings = {
      Lua = {},
    },
  },
  rust_analyzer = {
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
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
  },
  basedpyright = {
    flags = {
      debounce_text_changes = 1000,
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
  },
  volar = {
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    cmd = { "vue-language-server", "--stdio" },
  },
  jsonls = {
    cmd = { "vscode-json-languageserver", "--stdio" },
  },
  ruff = {
    init_options = {
      settings = {
        lint = {
          ignore = { "E501" },
        },
      },
    },
    cmd = { "ruff", "server", "--preview" },
  },
}

return {
  setup = function()
    vim.g.markdown_fenced_languages = {
      "ts=typescript",
    }

    local lspconfig = require('lspconfig')
    local blink = require('blink.cmp')

    for server, config in pairs(servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = blink.get_lsp_capabilities(config.capabilities)
      config.on_attach = on_attach
      lspconfig[server].setup(config)
    end
  end
}
