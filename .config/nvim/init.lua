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
  nbsp = '⦸',
  extends = '»',
  precedes = '«',
  tab = '▷⋯',
  trail = '•',
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

-- Fallback to slate because it's great!
vim.cmd.colorscheme('slate')

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
    dev = {
        path = vim.fn.expand('$HOME/Projects'),
        fallback = true,
    }
})

vim.cmd.colorscheme('catppuccin')

-- Monkey Patching, What could go wrong?!
local nvimSetFnPtr = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field Intentional monkey patch.
vim.keymap.set = function(mode, lhs, rhs, opts)
    if (opts and opts.commandab ~= nil) then
        local cmd = 'cnoreabbrev <silent> <expr> %s "%s"'

        vim.cmd(cmd:format(lhs, rhs))
        return
    end

    return nvimSetFnPtr(mode, lhs, rhs, opts)
end

vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
})

vim.keymap.set('n', 'bda', 'bufdo bd', { commandab = true })
vim.keymap.set('n', 'bda!', 'bufdo bd!', { commandab = true })
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')
vim.keymap.set('n', '{', ':execute "keepjumps norm! " . v:count1 . "{"<CR>', { silent = true })
vim.keymap.set('n', '}', ':execute "keepjumps norm! " . v:count1 . "}"<CR>', { silent = true })
vim.keymap.set('n', '<leader>ll', vim.cmd.Lazy)
vim.keymap.set('n', '<leader>y', ':call system("socat - UNIX-CLIENT:/home/liam/.run/clipper.sock", @0)<CR>', { silent = true })

