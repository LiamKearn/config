return {
    'wincent/command-t',
    lazy = false,
    keys = {
        { '<leader>ff', vim.cmd.CommandTRipgrep },
        { '<leader>gg', vim.cmd.CommandTBuffer }
    },
    build = function()
        local lazypath = vim.fn.stdpath('data') .. '/lazy/command-t/lua/wincent/commandt/lib'
        local out = vim.fn.system({
            'make',
            '-C',
            lazypath
        })
        print(out)
        print('Built command-t')
    end,
    init = function()
        vim.g.CommandTPreferredImplementation = 'lua'
    end,
    config = function()
        require('wincent.commandt').setup({
            ignore_case = true,
            smart_case = true,
            order = 'forward',
            position = 'bottom',
        })
    end
}
