local vim = vim
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

local function on_attach(client, bufnr)
  require "lsp_signature".on_attach(
    {
      bind = true,
      handler_opts = {
        border = "single"
      }
    }
  )

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})")

  vim.api.nvim_command [[augroup Format]]
  vim.api.nvim_command [[autocmd! * <buffer>]]
  vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
  vim.api.nvim_command [[augroup END]]

  -- Mappings.
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>k", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<tab>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

  vim.lsp.handlers["workspace/symbol"] = require "lsputil.symbols".workspace_handler
  vim.lsp.handlers["textDocument/codeAction"] = require "lsputil.codeAction".code_action_handler
  -- vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  vim.lsp.handlers["textDocument/references"] = require "telescope.builtin".lsp_references
  -- vim.lsp.handlers['textDocument/definition'] = require"lspsaga.provider".lsp_finder
  vim.lsp.handlers["textDocument/definition"] = require "lsputil.locations".definition_handler
  vim.lsp.handlers["textDocument/declaration"] = require "lsputil.locations".declaration_handler
  vim.lsp.handlers["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
  vim.lsp.handlers["textDocument/implementation"] = require "lsputil.locations".implementation_handler
  vim.lsp.handlers["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler

  -- vim.lsp.handlers['textDocument/codeAction'] = require'lspsaga.codeaction'.code_action
  vim.lsp.handlers["textDocument/rename"] = require("lspsaga.rename").rename
  vim.lsp.handlers["textDocument/hover"] = require "lspsaga.hover".render_hover_doc
  vim.lsp.handlers["textDocument/signatureHelp"] = require "lspsaga.signaturehelp".signature_help
  -- textDocument/completion
  -- textDocument/documentHighlight
  -- textDocument/implementation*

  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = false
    }
  )

  vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
      return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
      local view = vim.fn.winsaveview()
      vim.lsp.util.apply_text_edits(result, bufnr)
      vim.fn.winrestview(view)
      if bufnr == vim.api.nvim_get_current_buf() then
        vim.api.nvim_command("noautocmd :update")
      end
    end
  end
end

lspconfig.jsonls.setup({on_attach = on_attach})
lspconfig.pyright.setup({on_attach = on_attach})
lspconfig.vuels.setup({on_attach = on_attach})
lspconfig.tsserver.setup({on_attach = on_attach})
lspconfig.sumneko_lua.setup(
  {
    cmd = {vim.fn.expand("~") .. "/.local/bin/sumneko_lua"},
    on_attach = on_attach,
    filetypes = {"lua"},
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";")
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {"vim"}
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
        }
      }
    }
  }
)

lspconfig.rust_analyzer.setup(
  {
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          extraArgs = "--target-dir /tmp/rust-analyzer-check"
        }
      }
    }
  }
)

lspconfig.efm.setup(
  {
    on_attach = on_attach,
    cmd = {
      "efm-langserver",
      "-c",
      vim.fn.expand("~") .. "/.config/efm-langserver/config.yaml",
      "-logfile",
      "/tmp/efm.log"
    },
    init_options = {documentFormatting = true},
    filetypes = {
      "python",
      "markdown",
      "rst",
      "yaml",
      "sh",
      -- "javascript",
      -- "typescript",
      "vue",
      "html",
      "css",
      "json",
      "lua"
    },
    root_dir = lspconfig.util.root_pattern(".git/", "Cargo.toml", "pyproject.toml", "package.json"),
    settings = {
      lintDebounce = 1000000000,
      rootMarkers = {".git/", "Cargo.toml", "pyproject.toml", "package.json"},
      languages = {
        python = {
          {
            lintCommand = "flake8 --stdin-display-name ${INPUT} -",
            lintStdin = true,
            lintFormats = {"%f:%l:%c: %m"}
          },
          {
            lintCommand = "mypy --show-column-numbers",
            lintFormats = {
              "%f:%l:%c: %trror: %m",
              "%f:%l:%c: %tarning: %m",
              "%f:%l:%c: %tote: %m"
            }
          },
          {
            formatCommand = "black -",
            formatStdin = true
          },
          {
            formatCommand = "isort --stdout -",
            formatStdin = true
          }
        },
        markdown = {
          {
            formatCommand = "pandoc -f gfm -t gfm -s --tab-stop=2 --column=100"
          }
        },
        rst = {
          {
            formatCommand = "pandoc -f rst -t rst -s --columns=79"
          }
        },
        yaml = {
          {
            lintCommand = "yamllint -f parsable -",
            lintStdin = true
          }
        },
        sh = {
          {
            lintCommand = "shellcheck -f gcc -x",
            lintFormats = {
              "%f:%l:%c: %trror: %m",
              "%f:%l:%c: %tarning: %m",
              "%f:%l:%c: %tote: %m"
            }
          }
        },
        javascript = {
          {
            lintCommand = "eslint -f unix --stdin",
            lintStdin = true,
            lintIgnoreExitCode = true
          },
          {
            formatCommand = "./node_modules/.bin/prettier"
          }
        },
        -- typescript = {
        --   {
        --     lintCommand = "eslint -f unix --stdin",
        --     lintStdin = true,
        --     lintIgnoreExitCode = true
        --   },
        --   {
        --     formatCommand = "./node_modules/.bin/prettier"
        --   }
        -- },
        vue = {
          {
            lintCommand = "eslint -f unix --stdin",
            lintStdin = true,
            lintIgnoreExitCode = true
          },
          {
            formatCommand = "./node_modules/.bin/prettier"
          }
        },
        html = {
          {
            formatCommand = "./node_modules/.bin/prettier --parser html"
          }
        },
        css = {
          {
            formatCommand = "./node_modules/.bin/prettier --parser css"
          }
        },
        json = {
          {
            formatCommand = "./node_modules/.bin/prettier --parser json"
          },
          {
            lintCommand = "jq ."
          }
        },
        -- toml = {
        --   {
        --     formatCommand = "toml-fmt",
        --     formatStdin = true
        --   }
        -- },
        lua = {
          {
            formatCommand = "luafmt --stdin --indent-count 2",
            formatStdin = true
          }
        }
      }
    }
  }
)

vim.api.nvim_command(
  [[
autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs
\ :lua require'lsp_extensions'.inlay_hints {
\   prefix = ' » ',
  \   aligned = true,
  \   highlight = "NonText"
\ }]]
)
