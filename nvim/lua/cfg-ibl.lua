require('ibl').setup {
    indent = {
        char = "│",
        tab_char = "┆",
    },
    scope = { -- Uses treesitter to determine the scope
        enabled = true,
        char = "┃", -- Uses a bold character to show scope indent for visual clarity. Should use a different highlight maybe?
    },
    exclude = { 
        buftypes = { "terminal", "nofile" },
        filetypes = { "help", "markdown" }
    },
}
