-- Setup
require('telescope').setup {}

-- Shortcuts
local builtin = require('telescope.builtin')

-- Find files by name
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })

-- Find in the content of files (using ripgrep)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })

-- Find in lsp refences
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'LSP references' })

-- Find in lsp workspace symbols
vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, { desc = 'LSP workspace symbols' })

-- Open file browser from current path
vim.keymap.set('n', '<leader>fb', function()
  require("telescope").extensions.file_browser.file_browser({path="%:p:h"})
end, { desc = 'File browser' })

-- Open file brower from project path
vim.keymap.set('n', '<leader>fp', function()
  require('telescope').extensions.file_browser.file_browser()
end, { desc = 'File browser project' })

