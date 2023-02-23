local autocmd = vim.api.nvim_create_autocmd

local directories =  {
    [vim.fn.expand('$HOME/Notes')] = {
        autocommit = true,
        autoreference = true,
        autotitle = true,
        base = './',
        transform = 'local',
    }
}

local loadIfApplicable = function()
    local dir = vim.fn.getcwd()
    if (directories[dir] ~= nil) then
        vim.cmd('Lazy load corpus')
    end
end

autocmd('User', {
    pattern = 'VeryLazy',
    callback = loadIfApplicable
})

autocmd('DirChanged', {
    pattern = '*',
    callback = loadIfApplicable
})

return {
    'wincent/corpus',
    lazy = true,
    init = function()
        CorpusDirectories = directories
    end
}
