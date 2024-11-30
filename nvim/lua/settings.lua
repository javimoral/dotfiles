-- Leader
vim.g.mapleader = ","

-- Colorscheme
vim.o.termguicolors = true
vim.o.background = "light"
vim.cmd("colorscheme solarized8_high")

-- File Indent
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.o.smarttab = true
vim.bo.autoindent = true
vim.bo.smartindent = true

-- UI
vim.wo.number = true
vim.wo.cursorline = true
vim.o.showmatch = true
vim.o.scrolloff = 14
vim.o.lazyredraw = true
vim.wo.relativenumber = true

-- Toogle relative number
vim.api.nvim_set_keymap("n", "<leader>n", ":lua vim.wo.relativenumber = not vim.wo.relativenumber<CR>", {silent = true})

vim.o.mouse = "nv"

vim.o.listchars = "tab:⇥⇥,eol:↵"

-- Folding
vim.wo.foldenable = true
-- By default starts folding all the file
-- Setting an high level start avoids that
vim.o.foldlevelstart = 10
vim.wo.foldnestmax = 10
vim.wo.foldmethod = "syntax"
vim.api.nvim_set_keymap("n", "<space>", "za", {noremap = true})

-- Movement
-- Begin of line with B
vim.api.nvim_set_keymap("", "B", "^", {noremap = true})
vim.api.nvim_set_keymap("", "^", "<nop>", {noremap = true})
-- End of line with E
vim.api.nvim_set_keymap("", "E", "$", {noremap = true})
vim.api.nvim_set_keymap("", "$", "<nop>", {noremap = true})

require('cfg-indent') -- indentLine
require('cfg-treesitter') -- nvim-treesitter/*
require('cfg-lsp') -- lsp client
require('cfg-telescope') -- telescope config
require('cfg-compe') -- Autocompletion

-- Hardline
require('hardline').setup {}

