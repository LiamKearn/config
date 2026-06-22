vim.g.CommandTPreferredImplementation = 'lua'

require('wincent.commandt').setup({
    ignore_case = true,
    smart_case = true,
    order = 'forward',
    position = 'bottom',
})

local home = vim.fn.expand('$HOME')
vim.keymap.set('n', '<leader>ff', function()
    if (vim.fn.getcwd() == home) then
        print('Prevented searching home directory.')
        return
    end
    vim.cmd.CommandTRipgrep()
end)

vim.keymap.set('n', '<leader>fh', vim.cmd.CommandTHelp)
vim.keymap.set('n', '<leader>gg', vim.cmd.CommandTBuffer)

