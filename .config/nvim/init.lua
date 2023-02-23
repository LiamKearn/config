-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Gutter
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.nu = true

-- Cursor
vim.opt.guicursor = 'n-v-c-i-sm:block'

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Misc
vim.opt.virtualedit = 'block'
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.updatetime = 50
vim.opt.lazyredraw = true
vim.opt.scrolloff = 8
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shellcmdflag = '-lc'

-- Files
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Spacing
vim.opt.textwidth = 80
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- From Greg Hurrell's config.
vim.opt.list = true
vim.opt.listchars = {
  nbsp = '⦸', -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
  extends = '»', -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
  precedes = '«', -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
  tab = '▷⋯', -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
  trail = '•', -- BULLET (U+2022, UTF-8: E2 80 A2)
}

-- GUI
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Filetype mappings.
vim.g.filetype_ss = 'html'

-- Install lazy.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
    change_detection = {
        enabled = true,
        notify = false,
    },
})

local autocmd = vim.api.nvim_create_autocmd
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

autocmd('InsertEnter', {
    pattern = '*',
    callback = function()
        -- TODO: All the reloading here is evil.
        vim.g.gruvbox_material_background = 'medium'
        vim.cmd('colorscheme gruvbox-material')
        require('lualine').setup({
            options = {
                icons_enabled = false,
                theme = 'gruvbox-material',
                component_separators = '|',
                section_separators = '',
            }
        })
    end
})

autocmd('InsertLeave', {
    pattern = '*',
    callback = function()
        vim.g.gruvbox_material_background = 'hard'
        vim.cmd('colorscheme gruvbox-material')
        require('lualine').setup({
            options = {
                icons_enabled = false,
                theme = 'gruvbox-material',
                component_separators = '|',
                section_separators = '',
            }
        })
    end
})

require('keymap')

