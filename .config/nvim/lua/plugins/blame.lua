return {
    'ruanyl/vim-gh-line',
    keys = {
        { '<leader>gh' },
        { '<leader>gb' },
        { '<leader>go' },
    },
    init = function()
        vim.g.gh_use_canonical = 1
    end
}
