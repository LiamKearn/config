-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Gutter
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.nu = true

-- Cursor
vim.opt.guicursor = 'n-v-c-sm:block,o-i-r:hor20'

-- Spell
-- https://neovim.io/doc/user/spell.html
-- 'zg' marks as good word.
-- 'zG' marks as good word (non persistent).
-- 'z=' shows suggestions
vim.opt.spelllang = 'en_au'
vim.opt.spell = false

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
vim.opt.sidescrolloff = 16
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shellcmdflag = '-lc'
vim.opt.cmdheight = 0

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
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Cursor lines.
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Filetype mappings.
vim.g.filetype_ss = 'html'

vim.cmd.colorscheme('koehler')

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
        path = vim.fn.expand('$HOME/Source'),
        fallback = true,
    },
    ui = {
        border = {
            { "╭" },
            { "─" },
            { "╮" },
            { "│" },
            { "╯" },
            { "─" },
            { "╰" },
            { "│" },
        }
    }
})

vim.keymap.set('n', '<leader>ll', vim.cmd.Lazy)

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
-- Buffer management.
vim.keymap.set('n', 'bda', 'bufdo bd', { commandab = true })
vim.keymap.set('n', 'bda!', 'bufdo bd!', { commandab = true })

-- Map arrow keys to no OP.
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

-- Don't pollute jump list with (what should be) small movements.
vim.keymap.set('n', '{', ':execute "keepjumps norm! " . v:count1 . "{"<CR>', { silent = true })
vim.keymap.set('n', '}', ':execute "keepjumps norm! " . v:count1 . "}"<CR>', { silent = true })

-- System yank binding.
vim.keymap.set('n', '<leader>y', function()
    if (vim.loop.os_uname().sysname == 'Darwin') then
        vim.cmd('call system("pbcopy", @0)')
    else
        local remote_socket = vim.fn.expand('$HOME/.run/clipper.sock')
        if (vim.loop.fs_stat(remote_socket)) then
            vim.cmd(string.format('call system("socat - UNIX-CLIENT:%s", @0)', remote_socket))
        else
            vim.cmd('call system("clip", @0)')
        end
    end
end, { silent = true, desc = 'Yank to system clipboard' })


-- TODO: Dry up this seemingly recurring pattern of toggle functions for opts.

-- Focusing toggles.
vim.keymap.set('n', '<leader>z', function()
    if (vim.wo.numberwidth == 20) then
        vim.wo.numberwidth = 4
    else
        vim.wo.numberwidth = 20
    end
end, { desc = 'Toggle Zen Mode' })

vim.keymap.set('n', '<leader>ws', function()
    vim.opt_local.spell = not vim.opt_local.spell:get()
    if (vim.opt_local.spell:get()) then
        print('Spell enabled')
    else
        print('Spell disabled')
    end
end, { desc = 'Toggle Spelling' })

vim.keymap.set('n', '<leader>ww', function()
    vim.wo.wrap = not vim.wo.wrap
    if (vim.wo.wrap) then
        print('Wrap enabled')
    else
        print('Wrap disabled')
    end
end, { desc = 'Toggle Wrap' })

vim.keymap.set('n', '<leader>bd', function()
    vim.cmd('highlight Normal guibg=black')
end, { desc = 'Background dark' })

vim.keymap.set('n', '<leader>bl', function()
    vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
end, { desc = 'Background light' })

