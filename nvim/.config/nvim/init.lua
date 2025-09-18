vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.foldmethod = "indent"
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 20
vim.opt.foldenable = true
vim.opt.mousescroll = "ver:1"
vim.opt.number = true
vim.opt.wrap = true
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.smartindent = true
vim.opt.swapfile = false

-- Disable built-in python provider
vim.g.loaded_python3_provider = false

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
