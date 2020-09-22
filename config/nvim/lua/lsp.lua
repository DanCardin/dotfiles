local nvim_lsp = require('nvim_lsp')
local lsp_status = require('lsp-status')
local diagnostic = require('diagnostic')
local completion = require('completion')

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()')

  diagnostic.on_attach()
  completion.on_attach()
  lsp_status.on_attach(client)

  -- Mappings.
  local opts = { noremap=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>h', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  vim.lsp.callbacks['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  vim.lsp.callbacks['textDocument/references'] = require'lsputil.locations'.references_handler
  vim.lsp.callbacks['textDocument/definition'] = require'lsputil.locations'.definition_handler
  vim.lsp.callbacks['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
  vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
  vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
  vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
  vim.lsp.callbacks['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
end

lsp_status.register_progress()
lsp_status.config({
  status_symbol = '',
})

nvim_lsp.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})

nvim_lsp.vimls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})

nvim_lsp.jsonls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})

nvim_lsp.pyls.setup({
  settings = {
    pyls = {
      configurationSources = {'flake8'}
    },
    plugins = {
      pydocstyle = {
        enabled = true
      }
    }
  },
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
-- nvim_lsp.pyls_ms.setup({
--   callbacks = lsp_status.extensions.pyls_ms.setup(),
--   settings = { python = { workspaceSymbols = { enabled = true }}},
--   on_attach = on_attach,
--   capabilities = lsp_status.capabilities
-- })

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})

nvim_lsp.vuels.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
