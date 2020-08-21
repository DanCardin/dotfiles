local nvim_lsp = require('nvim_lsp')
local lsp_status = require('lsp-status')
local diagnostic = require('diagnostic')
local completion = require('completion')

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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

nvim_lsp.pyls_ms.setup({
  callbacks = lsp_status.extensions.pyls_ms.setup(),
  settings = { python = { workspaceSymbols = { enabled = true }}},
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
