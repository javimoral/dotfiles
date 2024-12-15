require('nvim-tree').setup()

vim.api.nvim_set_keymap("n", "<leader>nv", ":NvimTreeToggle<CR>", {silent = true})
