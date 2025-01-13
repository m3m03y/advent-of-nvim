# 04 - Plugins

## Lazy.nvim
Docs: https://lazy.folke.io/installation

## Plugins
`require("config.lazy")` -> config/lazy in LUA catalogs that are in runtime paths

rtp -> runtimepath

I encountered issue: https://github.com/neovim/neovim/issues/27951
Quick fix: `sudo ln -s /usr/lib/nvim/ /usr/lib64/nvim`

Healthcheck:
`:checkhealth lazy`
