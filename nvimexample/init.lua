vim.hl = vim.highlight -- Temporary fix: https://github.com/neovim/neovim/issues/31675
print("advent of neovim")

require("config.lazy")

vim.cmd [[hi @function.builtin.lua guifg=yellow]]
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
    

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
