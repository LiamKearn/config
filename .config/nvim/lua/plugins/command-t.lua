return {
    'wincent/command-t',
    dev = false,
    lazy = false,
    keys = {
        {
            '<leader>ff',
            function ()
                if (vim.fn.getcwd() == vim.fn.expand('$HOME')) then
                    print('Searching home is slow use Ripgrep instead :p')
                    return
                end
                vim.cmd.CommandTRipgrep()
            end
        },
        { '<leader>fh', vim.cmd.CommandTHelp },
        { '<leader>gg', vim.cmd.CommandTBuffer }
    },
    build = function(opts)
        local lazypath = vim.fn.stdpath('data') .. '/lazy/command-t/lua/wincent/commandt/lib'
        if (opts.dev ~= nil and opts.dev) then
            lazypath = vim.fn.expand('$HOME/Projects') .. '/command-t/lua/wincent/commandt/lib'
        end
        local out = vim.fn.system({
            'make',
            '-C',
            lazypath
        })
        if (vim.v.shell_error ~= 0) then
            print(out)
            print('Failed to build')
            return
        end
        print('Built command-t')
    end,
    init = function()
        vim.g.CommandTPreferredImplementation = 'lua'
    end,
    opts = {
        ignore_case = true,
        smart_case = true,
        order = 'forward',
        position = 'bottom',
        -- send_handlers = {
        --     quickfix = function()
        --     end
        -- }
    },
    config = function(_, opts)
        require('wincent.commandt').setup(opts)
    end
}
