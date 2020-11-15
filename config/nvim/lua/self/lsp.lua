local nvim_lsp = require('nvim_lsp')
local completion = require('completion')
local vim = vim

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')
  vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 3000)')

  completion.on_attach()

  -- Mappings.
  local opts = { noremap=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>j', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<tab>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>p', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
  vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
end

nvim_lsp.sumneko_lua.setup({
  on_attach = on_attach,
  filetypes = {'lua', 'lua.luapad', 'luapad'},
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ';'), },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          },
        }
      }
    }
  })

nvim_lsp.vimls.setup({
  on_attach = on_attach,
})

nvim_lsp.jsonls.setup({
  on_attach = on_attach,
})

local configs = require('nvim_lsp/configs')
configs.pyright = {
  default_config = {
    cmd = {"pyright-langserver", "--stdio"};
    filetypes = {"python"};
    root_dir = nvim_lsp.util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt");
    settings = {
      analysis = { autoSearchPaths= true; };
      pyright = { useLibraryCodeForTypes = true; };
    };
    -- The following before_init function can be removed once https://github.com/neovim/neovim/pull/12638 is merged
    before_init = function(initialize_params)
      initialize_params['workspaceFolders'] = {{
        name = 'workspace',
        uri = initialize_params['rootUri']
      }}
    end
    };
}

nvim_lsp.pyright.setup({
  on_attach = on_attach,
})

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        extraArgs = "--target-dir /tmp/rust-analyzer-check"
      }
    }
  }
})

nvim_lsp.vuels.setup({
  on_attach = on_attach,
})

nvim_lsp.diagnosticls.setup {
  filetypes = { "javascript", "typescript", "python" },
  init_options = {
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      python = {"flake8", "mypy"},
    },
    linters = {
      flake8 = {
        sourceName = "flake8",
        command = "flake8",
        args = {
          "%file",
        },
        formatPattern = {
          "^.*:(\\d+?):(\\d+?): ([A-Z][1-9]+?) (.*)$",
          {
            line = 1,
            column = 2,
            security = 3,
            message = 4,
          },
        },
        securities = {
          error = "error"
        },
      },
      mypy = {
        sourceName = "mypy",
        command = "mypy",
        args = {
          "--no-color-output",
          "--no-error-summary",
          "--show-column-numbers",
          -- "--follow-imports=silent",
          "%file",
        },
        formatPattern = {
          "^.*:(\\d+?):(\\d+?): ([a-z]+?): (.*)$",
          {
            line = 1,
            column = 2,
            security = 3,
            message = 4,
          },
        },
        securities = {
          error = "error"
        },
      },
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = { ".git" },
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity",
        };
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    },
    formatters = {
      black = {
        command = "black",
        args = {"%file"},
        doesWriteToFile = true,
        -- args = {"-"},
        -- doesWriteToFile = false,
        rootPatterns = {".git", "pyproject.toml", "setup.cfg"},
      },
      isort = {
        command = "isort",
        args = {"%file"},
        doesWriteToFile = true,
        rootPatterns = {".git", "pyproject.toml", "setup.cfg"},
      },
      rustfmt = {
        command = "rustfmt",
        args = {"%file"},
        doesWriteToFile = true,
        rootPatterns = {".git", "Cargo.toml"},
      },
      prettier = {
        command = "prettier",
        args = {"%file"},
        doesWriteToFile = true,
        rootPatterns = {".git", "package.json"},
      },
    },
    formatFiletypes = {
      python = {"black", "isort"},
      rust = {"rustfmt"},
      javascript = {"prettier"},
      typescript = {"prettier"},
      vue = {"prettier"},
    }
  }
}

-- \   'python': ['black', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
-- \   'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
-- \   'typescript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
-- \   'vue': ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace'],
-- \   'rust': ['rustfmt', 'remove_trailing_lines', 'trim_whitespace'],
