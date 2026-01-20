# dotfiles

## zsh
Uses [zinit](https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#zinit-wiki)

## nvim
Uses [vim-plug](https://github.com/junegunn/vim-plug)

### Plugins
Take a look at `zsh/nvim/lua/plug.lua` each pluging has a comment next to it describing it's use.

## Cheatsheet

| Shortcut | Action |
| -------- | ------ |
| `<Ctrl>+c` in insert mode | Backs to normal mode |

### Indentation
Using [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) for showing indentation. We've setup different characters for indentation using spaces or tabs.

| Indent Character | Indicator |
|------------------|-----------|
| Space | `│`|
| Tab   | `┆`|

Also, using `scope` to highlight current scope with a bold character.

### Motions
We've installed [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) which allows semantic motions like:


| Keymap   | Motion    |
|----------|-----------|
| `af`     | Outer Function |
| `if`     | Inner Function |
| `ac`     | Outer Class    |
| `ic`     | Inner Class    |
| `ib`     | Inner Block (can be between parenthesis) |

Combine it with [Comment.nvim](https://github.com/numToStr/Comment.nvim), a plugin to comment code, with treesitter support, and we can comment using this movements.

| Keymap   | Comment                                                          |
|----------|------------------------------------------------------------------|
| `gcc`    | Comments the current line - linewise comments (`// Comment`)     |
| `gbc`    | Comments the current line - blockwise comments (`/* Comment */`) |
| `gcaf`   | Comments the outer function - linewise comments                  |

### Surround
| Command                 | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| `ds<surround>`          | **Delete** a surrounding character (e.g., `ds"` removes surrounding quotes). |
| `cs<old><new>`          | **Change** surrounding characters (e.g., `cs"'` changes `"` to `'`).        |
| `ys<motion><surround>`  | **Add** a surrounding character (e.g., `ysiw"` surrounds a word with `"`). Motion accepts treesitter textobjects. |
| `yss<surround>`         | **Surround** an entire line (e.g., `yss"` surrounds the line with `"`).     |
| `vS<surround>`          | Surround a visually-selected area (e.g., `vS"` surrounds selection with `"`). |

### nvim-tree
| Command        | Description       |
|----------------|-------------------|
| `<leader>nv`   | Toggles nvim-tree |



## Notes to myself

### About nvim variables and scopes
| Prefix      | Scope            | Purpose                                    | Examples                                  |
|-------------|------------------|--------------------------------------------|------------------------------------------|
| `vim.o`     | Global Options   | Sets global editor options affecting all buffers and windows unless overridden locally. | `vim.o.number = true`, `vim.o.mouse = "a"` |
| `vim.wo`    | Window-local     | Sets options specific to a single window.  | `vim.wo.relativenumber = true`           |
| `vim.bo`    | Buffer-local     | Sets options specific to a single buffer.  | `vim.bo.filetype = "lua"`                |
| `vim.g`     | Global Variables | Defines or accesses global variables, typically used for plugin configuration or custom settings. | `vim.g.mapleader = " "`, `vim.g.plugin_option = true` |
| `vim.env`   | Environment Vars | Interacts with system environment variables. | `vim.env.HOME`, `vim.env.PATH`           |
| `vim.t`     | Tabpage-local    | Stores variables specific to a single tabpage. | `vim.t.my_var = "tab_value"`             |
| `vim.b`     | Buffer-local Vars| Stores variables tied to a single buffer.  | `vim.b.my_var = "buffer_value"`          |
| `vim.w`     | Window-local Vars| Stores variables tied to a single window.  | `vim.w.my_var = "window_value"`          |
| `vim.v`     | Built-in Vars    | Read-only variables for internal states or results of operations. | `vim.v.count`, `vim.v.version`           |
| `vim.opt`   | Unified Interface| Modern interface for setting options, supporting explicit scope prefixes like `global`, `win`, or `buf`. | `vim.opt.number = true`, `vim.opt_global.mouse = "a"` |


### Highlight groups

While configuring `indent-blankline` I've learned about Highlight gruops, a way of configuring the presentation of the text.

### treesitter, folding and indent

(n)vim can control indentation and folding evaluationg expressions. `vim.wo.foldexpr` dictates the expression to get folding. In a similar fashion, `vim.bo.indentexpr` set the expression for indentation.

Latest versions of nvim have built-in tree-sitter library support, leaving `nvim-treesitter` plugin for parser installation and some experimental features (indent). Thus, treesitter config is no longer from this pluging, but, as docs suggest, using `autocmd` with `FileType` events.

```lua
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
```

If we configure foldexpr globally, using `vim.opt.foldexpr` any FileType will try to use treesiter foldexpr, even if no syntax is installed, making folding unusable.

With this approach, we ensure a fallback to `foldmethod=syntax` if no tree-sitter syntax is found.

I've created an `FileType` autocmd for python files so I can launch treesitter and configure `foldexpr` and `indentexpr`.

To check this expressions, we can use:
```vim
:set foldexpr?
:set indentexpr?
```

#### Why closing parenthesis, brackets, and so on are indented wrong

Closing punctuation marks in python are indented to the same level as the opening one, instead of the belonging statement. 

```python
my_list = [
	"abc",
	"cba"
	]
```

It seems like a problem with Vims default `indentepxr` for Python `python#GetIndent(v:lnum)`

If we disable this indentation (with `:set indentexpr=`) or set up to `nvim-treesitter` indentexpr() this closing mark is at the same level at the statement:

```python
my_list = [
	"abc",
	"cba"
]
```

