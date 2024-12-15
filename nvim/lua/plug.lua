local Plug = vim.fn['plug#']

vim.call('plug#begin', vim.fn.stdpath 'data' .. '/plugged')
-- Theme
Plug 'lifepillar/vim-solarized8'

-- General Plugins
Plug 'tpope/vim-surround'                  -- Surround textobjects with puntuaction marks (parentheses, brackets, quotes, etc.)
Plug 'tpope/vim-repeat'                    -- Allows to use repeat command with vim-surround
Plug 'numToStr/Comment.nvim'               -- Comment / uncomment source code using text objects
Plug 'tpope/vim-fugitive'                  -- Git integration
Plug 'lukas-reineke/indent-blankline.nvim' -- Marks indentation
Plug 'norcalli/nvim-colorizer.lua'         -- Shows RGB colors while editing HTML/CSS
Plug 'nvim-tree/nvim-tree.lua'             -- File navigation
Plug 'nvim-tree/nvim-web-devicons'         -- Show filetype icons next to filenames in nvim-tree, Telescope, etc.
Plug 'cohama/lexima.vim'                   -- Auto-close parentheses, brackets, etc.
Plug 'ojroques/nvim-hardline'              -- Navigation line

-- Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


-- Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

-- Snippets
Plug 'L3MON4D3/LuaSnip'

-- LSP Setup
Plug 'neovim/nvim-lspconfig'    -- LSP Configs
Plug 'hrsh7th/nvim-cmp'         -- Completion Engine
Plug 'hrsh7th/cmp-nvim-lsp'     -- Completion source: LSP
Plug 'hrsh7th/cmp-buffer'       -- Compleiton source: Words from buffer
Plug 'hrsh7th/cmp-path'         -- Completion source: Paths
Plug 'saadparwaiz1/cmp_luasnip' -- Completion source: Snippets (from LuaSnip)

vim.call('plug#end')
