return {
    'wincent/command-t',
    build = function()
        local lazypath = vim.fn.stdpath('data') .. '/lazy/command-t/lua/wincent/commandt/lib'
        vim.fn.system({
            'make',
            '-C',
            lazypath
        })
    end,
    init = function()
        vim.g.CommandTPreferredImplementation = 'lua'
    end,
    config = function()
        require('wincent.commandt').setup()
    end
}
