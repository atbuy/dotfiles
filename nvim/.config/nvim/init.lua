vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set rnu!")
vim.cmd("set foldmethod=indent")
vim.cmd("set foldcolumn=0")
vim.cmd("set foldlevel=20")
vim.cmd("set foldenable")
-- vim.cmd("set notermguicolors")
vim.opt.number = true
vim.g.mapleader = " "

-- Load lazy.nvim and if it's not found then install it
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Start lazy
require("lazy").setup("plugins")

-- Load keymaps
require("keymaps.general")
