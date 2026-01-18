-- Treesitter main configuration
require('nvim-treesitter').setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = false
    }
}

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
