-- LSP
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


require('lspconfig').rust_analyzer.setup {capabilities = capabilities, on_attach = on_attach}
require('lspconfig').jedi_language_server.setup {capabilities = capabilities, on_attach = on_attach}
-- General Purpose Lang Server, used to linting & formatting
-- https://github.com/mattn/efm-langserver
require('lspconfig').efm.setup {
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {'.git/'},
    languages = {
      python = {
        {formatCommand = 'black --quiet -', formatStdin = true},
        {formatCommand = 'isort --quiet -', formatStdin = true},
        {
          lintCommand = 'pylint --init-hook="import pylint_venv; pylint_venv.inithook(force_venv_activation=True)" --output-format text --score no --msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}',
          lintStdin = false,
          lintFormats = {'%f:%l:%c:%t:%m'},
          lintOffsetColumns = 1,
          lintCategoryMap = {
            I = 'H',
            R = 'I',
            C = 'I',
            W = 'W',
            E = 'E',
            F = 'E',
          }
        }
      }
    },
    filetypes = { 'python' }
  }
}


