-- Setup
require('telescope').setup {}

-- Shortcuts
vim.api.nvim_set_keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>",  {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>",  {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fr", ":lua require('telescope.builtin').lsp_references()<cr>",  {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fs", ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", {noremap = true, silent = true})
