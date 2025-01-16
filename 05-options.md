# 05 - options

```
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus" # copy from clipboard
```

ft -> filetype

```
mkdir -p ~/.config/nvimexample/after/ftplugin
cd ~/.config/nvimexample/after/ftplugin
touch lua.lua
```

first `lua` is filetype (language type)
ex.: go.lua, py.lua
```
vim.opt_local.shiftwidth = 2    # options per file
```

other way:

```
local set = vim.opt_local

set.shiftwidth = 2
set.number = true
set.relativenumber = true
```
