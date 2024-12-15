local Plug = vim.fn['plug#']

vim.call('plug#begin', vim.fn.stdpath 'data' .. '/plugged')
Plug 'lifepillar/vim-solarized8'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'ap/vim-css-color'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'neovim/nvim-lspconfig'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'cohama/lexima.vim'
Plug 'ojroques/nvim-hardline'
vim.call('plug#end')
