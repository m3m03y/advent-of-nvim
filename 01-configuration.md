# 01 - Introduction

## First config:
```
Note:
NVIM_APPNAME=nvimexample nvim # fresh and clean neovim
```
1. Create config directory:
    `mkdir -p .config/nvim` or `mkdir -p .config/nvimexample`
2. Go inside condig:
    `cd .config/<NVIM_APPNAME>`
3. Edit `init.lua` file:
    `NVIM_APPNAME=nvimexample nvim init.lua`
4. Add print lines ex.:
    `print('advent of nvim day1')`
5. Write: `:write` or `:w` and quit: `:quit` or `:q` -> `:wq`
6. Reopen file:
    `NVIM_APPNAME=nvimexample nvim init.lua`
7. Display messages: `:messages`
There is a "advent of nvim day1" line at the bottom.

## How to reload config?
- `:source %` -> `%` is placeholder for current opened file (uses only saved changes)
- `:lua ...` or select line with `shift+v` and `:'<,'>lua` to run specific lines
