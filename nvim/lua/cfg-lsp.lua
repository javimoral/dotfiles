-- LSP
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
  
  -- Mappings
  local opts = { buffer = bufnr }
  
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Go to declaration' })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover documentation' })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Go to references' })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Go to implementation' })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature help' })
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = 'Add workspace folder' })
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = 'Remove workspace folder' })
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, desc = 'List workspace folders' })
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Type definition' })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename symbol' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code action' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { buffer = bufnr, desc = 'Show line diagnostics' })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'Previous diagnostic' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr, desc = 'Next diagnostic' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { buffer = bufnr, desc = 'Diagnostics to loclist' })
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, { buffer = bufnr, desc = 'Format buffer' })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Rust
vim.lsp.config('rust_analyzer', { capabilities = capabilities, on_attach = on_attach })
--vim.lsp.enable('rust_analyzer')

-- Python
vim.lsp.config('jedi_language_server', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.enable('jedi_language_server')

vim.lsp.config('ruff', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.enable('ruff')

vim.lsp.config('ty', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.enable('ty')

