# dotfiles

## zsh
Uses [zinit](https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#zinit-wiki)

## nvim
Uses [vim-plug](https://github.com/junegunn/vim-plug)

## Some notes to myself
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

