-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Gutter
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.nu = true

-- Cursor
vim.opt.guicursor = "n-v-c-i-sm:block"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- TODO PORT
-- vim.opt.nohlsearch = true

-- Misc
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.updatetime = 50
vim.opt.scrolloff = 8

-- Spacing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- GUI
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

-- Install lazy.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

require("liamkearn")

vim.g.gruvbox_material_background = 'hard'
vim.cmd('colorscheme ' .. 'gruvbox-material')
