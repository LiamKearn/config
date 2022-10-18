-- Install packer.
local install_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
    end
end

if not pcall(require, "packer") then
    install_packer()
end

require("liamkearn")
vim.cmd([[
nnoremap <SPACE> <Nop>
let mapleader = " "
]])

vim.g.gruvbox_material_background = 'hard'
vim.cmd('colorscheme ' .. 'gruvbox-material')