-- TODO: Maybe https://github.com/folke/which-key.nvim
local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend('force',
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind('n', {noremap = false})
M.nnoremap = bind('n')
M.vnoremap = bind('v')
M.xnoremap = bind('x')
M.inoremap = bind('i')
M.snoremap = bind('n', {silent = true})

M.nnoremap('<Up>', '<Nop>')
M.nnoremap('<Down>', '<Nop>')
M.nnoremap('<Left>', '<Nop>')
M.nnoremap('<Right>', '<Nop>')

M.snoremap('{', ':execute "keepjumps norm! " . v:count1 . "{"<CR>')
M.snoremap('}', ':execute "keepjumps norm! " . v:count1 . "}"<CR>')

M.nnoremap('<leader>ll', vim.cmd.Lazy)

M.snoremap('<leader>y', ':call system("socat - UNIX-CLIENT:/home/liam/.run/clipper.sock", @0)<CR>')

return M
