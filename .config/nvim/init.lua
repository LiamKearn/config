-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Gutter
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.nu = true

-- Cursor
vim.opt.guicursor = 'n-v-c-sm:block,o-i-r:hor20'

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
vim.opt.background = 'light'
vim.opt.colorcolumn = '80'
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Window borders.
vim.o.winborder = 'rounded'

-- Cursor lines.
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.g.last_yank_event = vim.v.event
        vim.hl.on_yank()
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
})

-- System yank binding.
vim.keymap.set('n', '<leader>y', function()
    vim.hl.on_yank({
        higroup = 'DiffText',
        event = vim.g.last_yank_event,
    })
    vim.cmd('call system("pbcopy", @0)')
end, { silent = true, desc = 'Yank to system clipboard' })

-- Buffer management.
vim.api.nvim_create_user_command('BufDeleteAll', 'bufdo bd', { desc = 'Delete all buffers' })
vim.api.nvim_create_user_command('BufDeleteAllForce', 'bufdo bd!', { desc = 'Force delete all buffers' })

-- Map arrow keys to no OP.
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

-- Don't pollute jump list with (what should be) small movements.
vim.keymap.set('n', '{', ':execute "keepjumps norm! " . v:count1 . "{"<CR>', { silent = true })
vim.keymap.set('n', '}', ':execute "keepjumps norm! " . v:count1 . "}"<CR>', { silent = true })

-- Focusing toggles.
vim.keymap.set('n', '<leader>z', function()
    if (vim.wo.numberwidth == 20) then
        vim.wo.numberwidth = 4
    else
        vim.wo.numberwidth = 20
    end
    print((vim.wo.numberwidth == 20 and 'Enabled' or 'Disabled') .. ' Zen mode')
end, { desc = 'Toggle Zen Mode' })

vim.keymap.set('n', '<leader>ww', function()
    vim.wo.wrap = not vim.wo.wrap
    print((vim.wo.wrap and 'Enabled' or 'Disabled') .. ' wrap')
end, { desc = 'Toggle Wrap' })

-- Used for split/multi-window plugins to lazy load.
vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        if #vim.api.nvim_list_wins() > 1 then
            vim.api.nvim_exec_autocmds("User", { pattern = "MultiWindowInit" })
            -- Stop further processing of this event
            return true
        end
    end,
})

local function statusline()
    function Statusline_visual_selection()
        local mode = vim.fn.mode()
        if mode ~= 'v' and mode ~= 'V' and mode ~= '' then
            return ''
        end
        local start_pos = vim.fn.getpos("v")
        local end_pos = vim.fn.getpos(".")

        if start_pos[2] > end_pos[2] then
            start_pos[2], end_pos[2] = end_pos[2], start_pos[2]
        end
        local lines_selected = end_pos[2] - start_pos[2] + 1

        return string.format(" [%d lines]", lines_selected)
    end

    function Statusline_get_mode()
        local text = 'OTHER'
        local hi = 'Normal'

        local mode = vim.fn.mode()
        if mode == 'n' then
            text = 'NORMAL'
        elseif mode == 'i' then
            hi = 'DiffAdd'
            text = 'INSERT'
        elseif mode == 'v' then
            hi = 'IncSearch'
            text = 'VISUAL'
        elseif mode == 'V' then
            hi = 'DiffText'
            text = 'VISUAL LINE'
        elseif mode == '' then
            hi = 'PmenuMatch'
            text = 'VISUAL BLOCK'
        elseif mode == 't' then
            hi = 'Question'
            text = 'TERMINAL'
        end

        return string.format('%%#%s# %s %%#StatusLine#', hi, text)
    end

    local mode = '%{%v:lua.Statusline_get_mode()%}'
    local filename = '%f'
    local modified = '%m'
    local split = '%='
    local selection_lines = '%{v:lua.Statusline_visual_selection()}'
    local linecol = '%l:%c'

    return string.format(
        '%s %s %s %s %s %s ',
        mode,
        filename,
        modified,
        split,
        selection_lines,
        linecol
    )
end

vim.opt.statusline = statusline()

-- Install lazy.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local choice = vim.fn.confirm("Lazy is not installed, do you want to try and install and use it?", "&Yes\n&Continue without plugins", 2)
    if choice ~= 1 then
        return
    end
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

vim.cmd.colorscheme('github_light_high_contrast')
-- vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#e7ecf0" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "none", bold = true })

