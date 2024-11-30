vim.o.completeopt = "menu,menuone,noselect"

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
		['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		-- Al usar Insert en el behavior de C-p y C-n, no sería necesario esta parte, al insertarse automáticamente
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}
	},
	formatting = {
		format = function(entry, item)
			item.kind = ({
				Text = '',
				Method = '',
				Function = '',
				Constructor = '',
				Field = '',
				Variable = '',
				Class = '',
				Interface = 'ﰮ',
				Module = '',
				Property = '',
				Unit = '',
				Value = '',
				Enum = '',
				Keyword = '',
				Snippet = '﬌',
				Color = '',
				File = '',
				Reference = '',
				Folder = '',
				Enummember = '',
				Constant = '',
				Struct = '',
				Event = '',
				Operator = 'ﬦ',
				Typeparameter = '',
			})[item.kind]

			item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
			})[entry.source.name]

			return item
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}
