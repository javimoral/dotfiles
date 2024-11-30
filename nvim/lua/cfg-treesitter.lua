require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = false
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aP"] = "@parameter.outer",
                ["iP"] = "@parameter.inner"
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner"
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner"
            }
        }
    }
}

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
