-- Treesitter main configuration
require('nvim-treesitter').setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = false
    }
}

-- Autocmds
local treesitter_au = vim.api.nvim_create_augroup('treesitter', { clear = true } )
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'python'  },
	group = treesitter_au,
	callback = function() 
		vim.treesitter.start()
		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo.foldmethod = 'expr'
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- Textobjects
require('nvim-treesitter-textobjects').setup {
	select = {
		lookahead = true,
	}
}
-- Definitions
local select = require('nvim-treesitter-textobjects.select')

-- Functions
vim.keymap.set({'x', 'o'}, "af", function()
	select.select_textobject("@function.outer", "textobjects") 
end)

vim.keymap.set({'x', 'o'}, "if", function()
	select.select_textobject("@function.inner", "textobjects")
end)

-- Classes
vim.keymap.set({'x', 'o'}, "ac", function()
	select.select_textobject("@class.outer", "textobjects")
end)

vim.keymap.set({'x', 'o'}, "if", function()
	select.select_textobject("@class.inner", "textobjects")
end)

-- Parameters
vim.keymap.set({'x', 'o'}, "aP", function()
	select.select_textobject("@parameter.outer", "textobjects")
end)

vim.keymap.set({'x', 'o'}, "iP", function()
	select.select_textobject("@parameter.inner", "textobjects")
end)

