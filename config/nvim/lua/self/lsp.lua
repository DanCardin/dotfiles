local lsp = require('lspconfig')
-- local completion = require('completion')

local vim = vim

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')

  vim.api.nvim_command [[augroup Format]]
  vim.api.nvim_command [[autocmd! * <buffer>]]
  vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
  vim.api.nvim_command [[augroup END]]

  -- completion.on_attach()

  -- Mappings.
  local opts = { noremap=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<tab>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
  vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  -- vim.lsp.handlers['textDocument/definition'] = require"lspsaga.provider".lsp_finder
  vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler

  vim.lsp.handlers['textDocument/codeAction'] = require'lspsaga.codeaction'.code_action
  vim.lsp.handlers['textDocument/rename'] = require('lspsaga.rename').rename
  vim.lsp.handlers['textDocument/hover'] = require'lspsaga.hover'.render_hover_doc
  vim.lsp.handlers['textDocument/signatureHelp'] = require'lspsaga.signaturehelp'.signature_help
    -- textDocument/completion
    -- textDocument/declaration*
    -- textDocument/definition
    -- textDocument/documentHighlight
    -- textDocument/documentSymbol
    -- textDocument/implementation*
    -- textDocument/publishDiagnostics
    -- textDocument/references
    -- textDocument/rename
    -- textDocument/signatureHelp
    -- textDocument/typeDefinition*
    -- window/logMessage
    -- window/showMessage
    -- window/showMessageRequest

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

lsp.sumneko_lua.setup({
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

-- lsp.vimls.setup({
--   on_attach = on_attach,
-- })

lsp.jsonls.setup({
  on_attach = on_attach,
})

lsp.pyright.setup({
  on_attach = on_attach,
})

lsp.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        extraArgs = "--target-dir /tmp/rust-analyzer-check"
      }
    }
  }
})

lsp.vuels.setup{
  on_attach = on_attach,
}

lsp.tsserver.setup {
  on_attach = on_attach,
}

lsp.efm.setup {
  on_attach = on_attach,
  root_dir = lsp.util.root_pattern(".git/", "pyproject.toml", "Cargo.toml", "package.json"),
}
